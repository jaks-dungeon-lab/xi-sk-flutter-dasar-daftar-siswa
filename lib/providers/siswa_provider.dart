import 'package:flutter/material.dart';
import '../models/siswa.dart'; // Jangan lupa import cetakannya!

// 1. Tambahkan "with ChangeNotifier" agar kelas ini bisa berteriak/menyiar
class SiswaProvider with ChangeNotifier {
  // 2. Pindahkan data rahasia ke sini (Sekarang menggunakan tipe data Siswa)
  final List<Siswa> _semuaSiswa = [
    Siswa(nama: 'BUDI SANTOSO', nis: '1020301', kelas: 'XI', jurusan: 'RPL 1'),
    Siswa(nama: 'AYU LESTARI', nis: '1020302', kelas: 'XI', jurusan: 'RPL 1'),
    Siswa(
      nama: 'SITI NURHALIZA',
      nis: '1020303',
      kelas: 'XI',
      jurusan: 'RPL 1',
    ),
  ];

  // 3. Buat "Pintu Keluar" (Getter) agar halaman lain bisa membaca data ini
  List<Siswa> get semuaSiswa => _semuaSiswa;

  // 4. Buat fungsi untuk menambahkan siswa baru
  void tambahSiswa(String nama, String jurusan, String kelas) {
    // Buat NIS buatan (simulasi)
    String nisBaru = '102030${_semuaSiswa.length + 1}';

    // Masukkan ke dalam daftar
    _semuaSiswa.add(
      Siswa(
        nama: nama.toUpperCase(),
        nis: nisBaru,
        kelas: kelas,
        jurusan: jurusan,
      ),
    );

    // 5. YANG PALING PENTING: Teriakkan "ADA DATA BARU!"
    notifyListeners();
  }
}
