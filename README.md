# Monitoring Kaderisasi Ansor (PWA)

Aplikasi mobile untuk memantau kaderisasi, terhubung ke Supabase project `kaderisasi`.

## Isi paket
- index.html          : aplikasi (login + dashboard)
- manifest.webmanifest, sw.js, icon-192.png, icon-512.png : agar bisa dipasang di layar utama HP
- views.sql           : arsip view Supabase (SUDAH dijalankan di database, tidak perlu dijalankan lagi)

## Langkah singkat
1. Supabase > Authentication > Users > Add user (centang Auto Confirm User).
2. Supabase > Authentication > Sign In / Providers > matikan "Allow new users to sign up".
3. Upload semua file di folder ini ke repo GitHub baru (index.html harus di root repo).
4. Import repo di https://vercel.com/new lalu Deploy.
5. Vercel > Settings > Domains > tambah monitor.ansorbogoronline.or.id,
   lalu di Cloudflare buat CNAME "monitor" (DNS only) sesuai nilai dari Vercel.
6. Di HP: buka tautan > menu > Tambahkan ke layar utama.

## Coba di komputer
  python -m http.server 8080      (lalu buka http://localhost:8080)

## Catatan
- Kunci di index.html adalah kunci publik (publishable). Jangan pernah memasukkan service_role key.
- Pengaturan ada di bagian CONFIG pada index.html (AMBANG_HADIR, NAMA_PENGGUNA, REFRESH_DETIK).
- Target peserta (100) diatur di view v_kpi_ringkasan di Supabase.

## Data alumni (pasca kaderisasi)
Tabel di Supabase: alumni_impor (sementara) dan alumni_kaderisasi (utama, dikunci RLS).
1. Simpan Excel alumni sebagai CSV dengan judul kolom persis seperti template_alumni_kaderisasi.csv.
2. Supabase > Table Editor > alumni_impor > Insert > Import data from CSV.
3. SQL Editor, jalankan:  select * from proses_impor_alumni();
4. Cek baris bermasalah:  select nama_kader, catatan from alumni_impor;

## Grafik interaktif dan rincian tabel
- Semua grafik bisa diketuk: muncul lembar rincian berisi nilai dan persentasenya.
- Di menu Alumni (dan Tren), ketuk grafik atau lokasi/angkatan untuk melihat tabel alumni dari database.
  Tabel hanya muncul untuk akun di CONFIG.AKUN_DETAIL; akun lain hanya melihat ringkasan.
- Jalankan alumni_detail.sql sekali di Supabase SQL Editor (membuat v_alumni_detail dan f_boleh_detail).
  Pembatasan akun dijaga di database, jadi akun lain tidak bisa membaca data alumni lewat API.
