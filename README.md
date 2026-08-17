# Aplikasi Daftar Siswa 🎓

Aplikasi pembelajaran Flutter untuk menampilkan daftar profil siswa. Proyek ini dibangun sebagai bagian dari materi **Studi Kasus Flutter Dasar**, yang mempraktikkan penggabungan berbagai *widget* inti dalam satu aplikasi utuh.

## Fitur Utama

- 🔍 **Pencarian Real-Time**: Kolom pencarian interaktif untuk memfilter nama siswa secara langsung (*search bar*).
- 📜 **Daftar Bergulir (*ListView*)**: Menggunakan `ListView.builder` dan `ListTile` untuk merender daftar siswa secara dinamis dan efisien.
- 🎨 **Desain Modern**: Memanfaatkan komponen antarmuka modern seperti `Card`, `CircleAvatar`, dan kustomisasi `ThemeData` dengan warna dasar *Indigo*.
- 🧭 **Navigasi (*Routing*)**: Menggunakan `Navigator.push` untuk berpindah dari halaman beranda ke layar profil detail siswa.

## Struktur Halaman

1. **Halaman Utama (`HalamanDaftarSiswa`)**: Menampilkan daftar identitas siswa beserta input pencarian pintar di bagian atas.
2. **Halaman Detail (`HalamanDetailSiswa`)**: Halaman khusus yang akan terbuka saat salah satu baris siswa ditekan, menampilkan foto profil dan teks identitas yang diperbesar.

## Menjalankan Aplikasi

Pastikan [Flutter SDK](https://flutter.dev/docs/get-started/install) telah terinstal di komputer Anda.

1. Buka terminal di dalam *folder* proyek ini.
2. Unduh *package* dependensi yang dibutuhkan:
   ```bash
   flutter pub get
   ```
3. Jalankan aplikasi (menggunakan *emulator* atau HP fisik):
   ```bash
   flutter run
   ```
