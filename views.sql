-- ============================================================
-- VIEW DASHBOARD (sudah dijalankan di project "kaderisasi")
-- File ini hanya arsip. Sumber data saat ini:
--   pendaftaran (formulir online) dan documents (koleksi sesi).
-- Absensi, kelulusan, dan PAC akan disesuaikan setelah data
-- peserta/absensi tersinkron ke Supabase.
-- ============================================================
create or replace view public.v_kpi_ringkasan as
select
  (select count(*) from public.pendaftaran where status <> 'duplikat')::int as total_peserta,
  100 as target_peserta,   -- target per pelatihan
  (select count(*) from public.pendaftaran
    where status <> 'duplikat'
      and (created_at at time zone 'Asia/Jakarta') >= date_trunc('week', now() at time zone 'Asia/Jakarta'))::int as baru_minggu_ini,
  0 as rata_hadir,         -- sementara
  0 as lulus,              -- sementara
  (select count(*) from public.pendaftaran where status = 'baru')::int as antre_verifikasi;

create or replace view public.v_tren_pendaftaran as
select w::date as minggu, count(p.id)::int as jumlah
from generate_series(date_trunc('week', now() at time zone 'Asia/Jakarta') - interval '7 weeks',
                     date_trunc('week', now() at time zone 'Asia/Jakarta'), interval '1 week') w
left join public.pendaftaran p
  on date_trunc('week', p.created_at at time zone 'Asia/Jakarta') = w and p.status <> 'duplikat'
group by w order by w;

create or replace view public.v_funnel_kaderisasi as
select 'Terdaftar' as tahap, count(*)::int as jumlah, 1 as urutan from public.pendaftaran where status <> 'duplikat'
union all
select 'Sudah diambil admin', count(*)::int, 2 from public.pendaftaran where status = 'diambil';

create or replace view public.v_kehadiran_per_sesi as
select 'Sesi ' || (data->>'nomor') as sesi, 0 as hadir, 0 as total, (data->>'nomor')::int as urutan
from public.documents where collection = 'sesi' order by urutan;

create or replace view public.v_peserta_per_pac as
select coalesce(nullif(data->>'pac',''), nullif(data->>'kecamatan',''), 'Belum diisi') as pac,
       count(*)::int as jumlah, 0 as persen_hadir
from public.pendaftaran where status <> 'duplikat' group by 1 order by jumlah desc;

create or replace view public.v_kelulusan_per_pac as
select coalesce(nullif(data->>'pac',''), nullif(data->>'kecamatan',''), 'Belum diisi') as pac,
       count(*)::int as peserta, 0 as lulus, 0 as persen_lulus
from public.pendaftaran where status <> 'duplikat' group by 1 order by peserta desc;

-- hanya pengguna login yang boleh membaca view
revoke all on public.v_kpi_ringkasan, public.v_tren_pendaftaran, public.v_funnel_kaderisasi,
              public.v_kehadiran_per_sesi, public.v_peserta_per_pac, public.v_kelulusan_per_pac from public, anon;
grant select on public.v_kpi_ringkasan, public.v_tren_pendaftaran, public.v_funnel_kaderisasi,
                public.v_kehadiran_per_sesi, public.v_peserta_per_pac, public.v_kelulusan_per_pac to authenticated;

-- 7. Pendaftar per hari (untuk kalender)
create or replace view public.v_pendaftaran_harian as
select (created_at at time zone 'Asia/Jakarta')::date as tanggal, count(*)::int as jumlah
from public.pendaftaran
where status <> 'duplikat' and created_at >= now() - interval '70 days'
group by 1 order by 1;
revoke all on public.v_pendaftaran_harian from public, anon;
grant select on public.v_pendaftaran_harian to authenticated;
