-- ============================================================
-- INSTRUKTUR (alumni LI-1) dan PELATIH (alumni SUSPELAT)
-- Jalankan sekali di Supabase > SQL Editor.
-- Tabel dikunci RLS (tanpa policy), aplikasi hanya membaca lewat view v_instruktur.
-- Aman dijalankan ulang: tabel dikosongkan lalu diisi lagi.
-- ============================================================
create table if not exists public.instruktur (
  id bigint generated always as identity primary key,
  nama text not null,
  kecamatan_asli text,          -- tulisan kecamatan di data sumber
  kecamatan text not null,      -- nama baku kecamatan Kab. Bogor
  peran text not null check (peran in ('Instruktur','Pelatih')),
  jenjang text not null,        -- LI-1 / SUSPELAT
  lokasi_jenjang text,          -- tempat pelaksanaan LI-1 / SUSPELAT
  tahun_jenjang int,
  kaderisasi_lanjutan text,     -- PKL, PKN-IX, PKN-XI, SUSBALAN, SUSBANPIM-VII
  lokasi_lanjutan text,
  created_at timestamptz not null default now()
);
alter table public.instruktur enable row level security;
revoke all on public.instruktur from public, anon, authenticated;

truncate public.instruktur restart identity;
insert into public.instruktur
  (nama, kecamatan_asli, kecamatan, peran, jenjang, lokasi_jenjang, tahun_jenjang, kaderisasi_lanjutan, lokasi_lanjutan)
values
  ('KH. ABDULLOH NAWAWI., S.PD', 'CARINGIN', 'CARINGIN', 'Instruktur', 'LI-1', null, null, 'PKL', null),
  ('DR. RIZALAH LUQMAN AF., M.PD', 'TANJUNGARI', 'TANJUNGSARI', 'Instruktur', 'LI-1', 'KOTA BEKASI', 2024, 'PKL', null),
  ('MAMAN DJAMALUDIN., M.PD', 'TANJUNGARI', 'TANJUNGSARI', 'Instruktur', 'LI-1', 'PURWAKARTA', 2017, 'PKL', null),
  ('DOMIRI A GHAZALY., S.H', 'GUNUNG PUTRI', 'GUNUNG PUTRI', 'Instruktur', 'LI-1', 'PURWAKARTA', 2017, 'PKN-IX', 'BOGOR'),
  ('M. ANGGA GUNAEFI, S.PD', 'CILEUNGSI', 'CILEUNGSI', 'Instruktur', 'LI-1', 'CIANJUR', 2018, 'PKL', null),
  ('SEPTA AJI S., S.KOM', 'CITEUREUP', 'CITEUREUP', 'Instruktur', 'LI-1', 'KAB BANDUNG', 2025, 'PKN-XI', 'SIDOARJO'),
  ('RACHMAN NUGERAHA., M.H', 'CITEUREUP', 'CITEUREUP', 'Instruktur', 'LI-1', 'SUMEDANG', 2023, 'PKN-XI', 'SIDOARJO'),
  ('ZULPIKAR S.PD', 'JONGGOL', 'JONGGOL', 'Instruktur', 'LI-1', 'KOTA BEKASI', 2024, 'PKL', null),
  ('ABDUL MUHIT., S.PD., M.PD', 'CARINGIN', 'CARINGIN', 'Instruktur', 'LI-1', 'CIANJUR', 2018, 'PKL', null),
  ('AHMAD ZULFIKOR., M.HUM', 'RUMPIN', 'RUMPIN', 'Instruktur', 'LI-1', 'KOTA BEKASI', 2024, 'PKL', null),
  ('ASEP SAPRUDIN NUR, S.PD', 'CARIU', 'CARIU', 'Instruktur', 'LI-1', 'CIANJUR', 2018, 'PKL', null),
  ('AHMAD ROYANI', 'PAMIJAHAN', 'PAMIJAHAN', 'Instruktur', 'LI-1', 'KOTA BEKASI', 2024, 'PKL', null),
  ('M. ABDUL MUHYI, S.E', 'CARINGIN', 'CARINGIN', 'Instruktur', 'LI-1', 'KAB BANDUNG', 2025, 'PKL', null),
  ('H. HUSAINI', 'CARINGIN', 'CARINGIN', 'Instruktur', 'LI-1', 'PURWAKARTA', 2017, 'PKL', null),
  ('DUHORI., S.PD', 'CARIU', 'CARIU', 'Instruktur', 'LI-1', 'CIANJUR', 2018, 'PKL', null),
  ('DEDEN', 'CISARUA', 'CISARUA', 'Instruktur', 'LI-1', 'PURWAKARTA', 2017, 'PKL', null),
  ('DJAMALUDIN., S.PD', 'CARINGIN', 'CARINGIN', 'Instruktur', 'LI-1', 'PURWAKARTA', 2017, 'PKL', null),
  ('DRH SATRIO', 'CISARUA', 'CISARUA', 'Instruktur', 'LI-1', 'CIANJUR', 2018, 'PKL', null),
  ('AMIN FAJRI., S.PD', 'LEUWILIANG', 'LEUWILIANG', 'Instruktur', 'LI-1', 'SUMEDANG', 2023, 'PKL', null),
  ('ZAKARIA AL ANSORI., S.PD', 'BOJONGGEDE', 'BOJONGGEDE', 'Instruktur', 'LI-1', 'SUBANG', 2026, 'PKL', null),
  ('RAHMATULLOH., S.H', 'PAMIJAHAN', 'PAMIJAHAN', 'Instruktur', 'LI-1', 'SUBANG', 2026, 'PKL', null),
  ('SUTARJO., S.PD.I', 'CIBINONG', 'CIBINONG', 'Pelatih', 'SUSPELAT', null, null, 'SUSBANPIM-VII', 'BOGOR'),
  ('FATHURI', 'GUNUNG PUTRI', 'GUNUNG PUTRI', 'Pelatih', 'SUSPELAT', null, null, 'SUSBANPIM-VII', 'BOGOR'),
  ('AHMAD ALFAROBY', 'TENJOLAYA', 'TENJOLAYA', 'Pelatih', 'SUSPELAT', 'KAB BANDUNG', 2025, 'SUSBALAN', null),
  ('ABDUL AGIM', 'CIAMPEA', 'CIAMPEA', 'Pelatih', 'SUSPELAT', 'KAB BANDUNG', 2025, 'SUSBALAN', null),
  ('BADRU KAMAL', 'CARINGIN', 'CARINGIN', 'Pelatih', 'SUSPELAT', 'BOGOR', 2016, 'SUSBALAN', null),
  ('ASEP SAEPULOH', 'CIGOMBONG', 'CIGOMBONG', 'Pelatih', 'SUSPELAT', 'BOGOR', 2016, 'SUSBALAN', null),
  ('MUHAMMAD JAUHARI THUSI', 'SUKARAJA', 'SUKARAJA', 'Pelatih', 'SUSPELAT', null, null, 'SUSBALAN', null),
  ('HIDAYATULLOH', 'CIGOMBONG', 'CIGOMBONG', 'Pelatih', 'SUSPELAT', 'CIANJUR', 2018, 'SUSBALAN', null),
  ('UBE BUDIMAN', 'CIGOMBONG', 'CIGOMBONG', 'Pelatih', 'SUSPELAT', 'CIANJUR', 2018, 'SUSBALAN', null),
  ('ALI', 'CARINGIN', 'CARINGIN', 'Pelatih', 'SUSPELAT', 'CIANJUR', 2018, 'SUSBALAN', null),
  ('AMANK', 'CARINGIN', 'CARINGIN', 'Pelatih', 'SUSPELAT', 'CIANJUR', 2018, 'SUSBALAN', null),
  ('PARID', 'CIGOMBONG', 'CIGOMBONG', 'Pelatih', 'SUSPELAT', 'CIANJUR', 2018, 'SUSBALAN', null),
  ('YUDI', 'MEGAMENDUNG', 'MEGAMENDUNG', 'Pelatih', 'SUSPELAT', 'CIANJUR', 2018, 'SUSBALAN', null),
  ('ABDUL AZIZ', 'CIAWI', 'CIAWI', 'Pelatih', 'SUSPELAT', 'CIANJUR', 2018, 'SUSBALAN', null),
  ('SUHENDRA', 'CIBINONG', 'CIBINONG', 'Pelatih', 'SUSPELAT', 'SUBANG', 2026, 'SUSBALAN', null),
  ('M. BIMAULANA YUSUF', 'KEMANG', 'KEMANG', 'Pelatih', 'SUSPELAT', 'SUBANG', 2026, 'SUSBALAN', null),
  ('ABDULLOH', 'CARINGIN', 'CARINGIN', 'Pelatih', 'SUSPELAT', 'SUBANG', 2026, 'SUSBALAN', null);

create or replace view public.v_instruktur as
select id, nama, kecamatan, peran, jenjang, lokasi_jenjang, tahun_jenjang,
       kaderisasi_lanjutan, lokasi_lanjutan,
       case when kaderisasi_lanjutan like 'PKN%' then 'PKN'
            when kaderisasi_lanjutan like 'SUSBANPIM%' then 'SUSBANPIM'
            else kaderisasi_lanjutan end as tingkat_lanjutan
from public.instruktur
order by peran desc, nama;
revoke all on public.v_instruktur from public, anon;
grant select on public.v_instruktur to authenticated;

-- cek: harus 21 Instruktur dan 17 Pelatih
select peran, count(*) from public.instruktur group by 1;
