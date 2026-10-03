-- ============================================================
-- ANGKATAN KADERISASI: PKD, Diklatsar, PKL, Susbalan
-- Jalankan sekali di Supabase > SQL Editor. Aman dijalankan ulang.
-- Tabel dikunci RLS; aplikasi membaca lewat view v_angkatan_kaderisasi.
-- ============================================================
create table if not exists public.angkatan_kaderisasi (
  id bigint generated always as identity primary key,
  jenis text not null check (jenis in ('PKD','Diklatsar','PKL','Susbalan')),
  angkatan int not null,
  angkatan_romawi text not null,
  lokasi text,                  -- PAC / satkoryon pelaksana (kosong untuk PKL & Susbalan)
  peserta_lulus int not null,
  created_at timestamptz not null default now()
);
alter table public.angkatan_kaderisasi enable row level security;
revoke all on public.angkatan_kaderisasi from public, anon, authenticated;

truncate public.angkatan_kaderisasi restart identity;
insert into public.angkatan_kaderisasi (jenis, angkatan, angkatan_romawi, lokasi, peserta_lulus) values
  ('PKD', 1, 'I', 'Cileungsi', 67),
  ('PKD', 2, 'II', 'Pamijahan', 50),
  ('PKD', 3, 'III', 'Cibungbulang', 50),
  ('PKD', 4, 'IV', 'Virtual (Cibinong)', 72),
  ('PKD', 5, 'V', 'Cisarua', 25),
  ('PKD', 6, 'VI', 'Cigudeg', 70),
  ('PKD', 7, 'VII', 'Jonggol', 27),
  ('PKD', 8, 'VIII', 'Pamijahan', 50),
  ('PKD', 9, 'IX', 'Caringin', 47),
  ('PKD', 10, 'X', 'Jasinga', 50),
  ('PKD', 11, 'XI', 'Leuwiliang', 50),
  ('PKD', 12, 'XII', 'Kemang', 26),
  ('PKD', 13, 'XIII', 'Parung Panjang', 34),
  ('PKD', 14, 'XIV', 'Rumpin', 23),
  ('PKD', 15, 'XV', 'Ciomas', 40),
  ('PKD', 16, 'XVI', 'Cariu', 45),
  ('PKD', 17, 'XVII', 'Rancabungur', 19),
  ('PKD', 18, 'XVIII', 'Cijeruk', 39),
  ('PKD', 19, 'XIX', 'Sukamakmur', 50),
  ('PKD', 20, 'XX', 'Tenjolaya', 28),
  ('PKD', 21, 'XXI', 'Gunung Putri', 14),
  ('PKD', 22, 'XXII', 'Tanjungsari', 43),
  ('PKD', 23, 'XXIII', 'Caringin', 30),
  ('PKD', 24, 'XXIV', 'Sukajaya', 50),
  ('PKD', 25, 'XXV', 'Klapanunggal', 33),
  ('PKD', 26, 'XXVI', 'Cigombong', 36),
  ('PKD', 27, 'XXVII', 'Tamansari', 34),
  ('PKD', 28, 'XXVIII', 'Bojonggede', 41),
  ('PKD', 29, 'XXIX', 'Cileungsi', 20),
  ('PKD', 30, 'XXX', 'Cibungbulang', 24),
  ('PKD', 31, 'XXXI', 'Pamijahan', 34),
  ('Diklatsar', 1, 'I', 'Megamendung', 80),
  ('Diklatsar', 2, 'II', 'Leuwiliang', 80),
  ('Diklatsar', 3, 'III', 'Tanjungsari', 80),
  ('Diklatsar', 4, 'IV', 'Parung', 80),
  ('Diklatsar', 5, 'V', 'Cibinong', 60),
  ('Diklatsar', 6, 'VI', 'Cibungbulang', 50),
  ('Diklatsar', 7, 'VII', 'Citeureup', 50),
  ('Diklatsar', 8, 'VIII', 'Gunung Putri', 50),
  ('Diklatsar', 9, 'IX', 'Caringin', 106),
  ('Diklatsar', 10, 'X', 'Kemang', 8),
  ('PKL', 1, 'I', null, 51),
  ('Susbalan', 1, 'I', null, 61);

create or replace view public.v_angkatan_kaderisasi as
select jenis, angkatan, angkatan_romawi, lokasi, peserta_lulus
from public.angkatan_kaderisasi
order by case jenis when 'PKD' then 1 when 'Diklatsar' then 2 when 'PKL' then 3 else 4 end, angkatan;
revoke all on public.v_angkatan_kaderisasi from public, anon;
grant select on public.v_angkatan_kaderisasi to authenticated;

-- cek: PKD 31 angkatan (1.221 lulus), Diklatsar 10 (644), PKL 1 (51), Susbalan 1 (61)
select jenis, count(*) angkatan, sum(peserta_lulus) lulus from public.angkatan_kaderisasi group by 1 order by 1;
