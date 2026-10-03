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
