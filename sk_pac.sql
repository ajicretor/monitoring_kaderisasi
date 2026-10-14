-- ============================================================
-- SK KETUA PAC periode 2025-2028 (40 PAC, ZONA I - ZONA VI)
-- Jalankan sekali di Supabase > SQL Editor. Aman dijalankan ulang.
-- Tabel dikunci RLS (tanpa policy), aplikasi hanya membaca lewat view v_sk_pac.
-- Kolom nomor_sk kosong = SK belum terbit / belum tercatat.
-- ============================================================
create table if not exists public.sk_pac (
  no_urut int primary key,
  ketua text,                   -- kosong bila belum tercatat
  kecamatan text not null,
  zona text not null,           -- korwil: ZONA I .. ZONA VI
  tgl_konferancab date,
  tgl_expired date,             -- masa berlaku SK
  nomor_sk text
);
alter table public.sk_pac enable row level security;
revoke all on public.sk_pac from public, anon, authenticated;

truncate public.sk_pac;
insert into public.sk_pac (no_urut, ketua, kecamatan, zona, tgl_konferancab, tgl_expired, nomor_sk) values
  (1, 'M. FALAHUDDIN', 'CITEUREUP', 'ZONA I', '2025-08-10', '2028-08-10', '919/PW-IX/SK-01/IX/2026'),
  (2, 'FACHRI', 'SUKARAJA', 'ZONA I', '2026-01-22', null, null),
  (3, 'DAWI HILMI MUHAZIR', 'CIBINONG', 'ZONA I', '2025-08-29', null, null),
  (4, 'ROYANI', 'BABAKAN MADANG', 'ZONA I', '2025-08-29', '2028-08-31', '920/PW-IX/SK-01/IX/2026'),
  (5, 'ISHAK HENDRIATNA', 'KLAPANUNGGAL', 'ZONA II', '2025-08-22', null, null),
  (6, 'ANUGRAH ROMADHON', 'SUKAMAKMUR', 'ZONA II', '2025-08-31', '2028-08-31', '916/PW-IX/SK-01/IX/2026'),
  (7, 'RAHMATIN', 'CILEUNGSI', 'ZONA II', '2025-10-05', '2028-10-05', '921/PW-IX/SK-01/IX/2026'),
  (8, 'AHMAD RIFAI', 'TANJUNGSARI', 'ZONA II', '2025-08-02', '2028-08-02', '601/PW-IX/SK-01/XI/2025'),
  (9, 'AHMAD SYAHRI SYARIPUDIN', 'GUNUNG PUTRI', 'ZONA II', '2025-08-31', '2028-08-31', '922/PW-IX/SK-01/IX/2026'),
  (10, 'M.FAHRIJAL', 'JONGGOL', 'ZONA II', '2025-08-08', '2028-08-08', '923/PW-IX/SK-01/IX/2026'),
  (11, 'ABDUL HAMID', 'CARIU', 'ZONA II', '2025-08-24', '2028-08-24', '917/PW-IX/SK-01/IX/2026'),
  (12, 'ARIQ AKMAL', 'CIOMAS', 'ZONA III', '2025-09-11', '2028-09-11', '924/PW-IX/SK-01/IX/2026'),
  (13, 'FAHMI FADHILAH', 'TAMANSARI', 'ZONA III', '2025-09-13', '2025-09-14', '925/PW-IX/SK-01/IX/2026'),
  (14, 'ASEP SAEPUDIN', 'CIGOMBONG', 'ZONA III', '2025-08-31', null, null),
  (15, 'M. ABDUL MUHYI', 'CARINGIN', 'ZONA III', '2025-08-04', '2028-08-04', '604/PW-IX/SK-01/XI/2025'),
  (16, 'MIFTAHUDIN', 'MEGAMENDUNG', 'ZONA III', '2025-08-26', '2028-08-26', '605/PW-IX/SK-01/XI/2025'),
  (17, 'DANI WIRYA PRATAMA', 'CIJERUK', 'ZONA III', '2025-11-22', null, null),
  (18, 'M. ADE ISHAQ', 'CISARUA', 'ZONA III', '2025-08-26', null, null),
  (19, 'MUHAMMAD DEDEN ABDUL MUHUI', 'CIAWI', 'ZONA III', '2025-11-22', null, null),
  (20, 'MAMAN ABDUL RAHMAN', 'LEUWILIANG', 'ZONA IV', '2025-08-30', '2028-08-30', '926/PW-IX/SK-01/IX/2026'),
  (21, 'AENUL YAQIN', 'CIBUNGBULANG', 'ZONA IV', '2025-08-23', '2028-08-23', '600/PW-IX/SK-01/XI/2025'),
  (22, 'TAUPIK HIDAYAT', 'CIAMPEA', 'ZONA IV', '2025-11-22', null, null),
  (23, 'DODO FEBRIAANSYAH', 'DRAMAGA', 'ZONA IV', '2025-11-21', null, null),
  (24, 'WAHYUDIN', 'PAMIJAHAN', 'ZONA IV', '2025-07-13', '2028-07-13', '612/PW-IX/SK-01/XI/2025'),
  (25, 'M. JIHAD ALFATH', 'TENJOLAYA', 'ZONA IV', '2025-08-10', '2028-12-24', '646/PW-IX/SK-01/XII/2025'),
  (26, 'MUHAMMAD IQBAL ALAMSYAH', 'LEUWISADENG', 'ZONA IV', '2025-11-21', null, null),
  (27, 'JAMALUDIN', 'RUMPIN', 'ZONA IV', '2025-11-22', null, null),
  (28, 'SAPROWI', 'PARUNG PANJANG', 'ZONA V', '2025-06-02', '2028-06-02', '913/PW-IX/SK-01/IX/2026'),
  (29, 'AGUNG FADILAH', 'JASINGA', 'ZONA V', '2025-08-30', '2028-08-23', '927/PW-IX/SK-01/IX/2026'),
  (30, null, 'SUKAJAYA', 'ZONA V', null, null, null),
  (31, 'DAMANHURI', 'CIGUDEG', 'ZONA V', '2025-07-26', null, null),
  (32, 'M. SAEPUL BAHRI', 'NANGGUNG', 'ZONA V', '2025-11-22', '2028-11-22', '914/PW-IX/SK-01/IX/2026'),
  (33, 'M. GUFRON AMIN', 'TENJO', 'ZONA V', '2026-02-09', null, null),
  (34, 'ROKI', 'BOJONGGEDE', 'ZONA VI', '2026-01-11', '2029-01-11', '928/PW-IX/SK-01/IX/2026'),
  (35, 'HARDI KURNIAWAN', 'RANCABUNGUR', 'ZONA VI', '2025-08-29', '2028-08-28', '918/PW-IX/SK-01/IX/2026'),
  (36, 'MUHAMMAD ALFIN ARRIZKI', 'GUNUNGSINDUR', 'ZONA VI', '2025-11-05', null, null),
  (37, 'MUHAMMAD JALIL SIDIK', 'KEMANG', 'ZONA VI', '2025-08-30', null, null),
  (38, 'OKA ERSA MAULANA', 'PARUNG', 'ZONA VI', '2026-03-06', null, null),
  (39, 'UJANG SOANA', 'TAJURHALANG', 'ZONA VI', '2025-11-04', '2028-11-07', '929/PW-IX/SK-01/IX/2026'),
  (40, 'MUHAMMAD SAPUAN', 'CISEENG', 'ZONA VI', '2025-08-22', '2028-08-22', '930/PW-IX/SK-01/IX/2026');

create or replace view public.v_sk_pac as
select no_urut, ketua, kecamatan, zona, tgl_konferancab, tgl_expired, nomor_sk
from public.sk_pac
order by no_urut;
revoke all on public.v_sk_pac from public, anon;
grant select on public.v_sk_pac to authenticated;

-- cek: harus 40 PAC, 23 sudah ada nomor SK, 17 belum
select count(*) as total_pac, count(nomor_sk) as sudah_sk, count(*) - count(nomor_sk) as belum_sk from public.sk_pac;
