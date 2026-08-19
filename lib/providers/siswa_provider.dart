import 'package:daftar_siswa/models/siswa.dart';
import 'package:flutter/material.dart';

class SiswaProvider with ChangeNotifier {
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

  List<Siswa> get semuaSiswa => _semuaSiswa;

  void tambahSiswa(String nama, String jurusan, String kelas) {
    String nisBaru = '102030${_semuaSiswa.length + 1}';

    _semuaSiswa.add(
      Siswa(
        nama: nama.toUpperCase(),
        nis: nisBaru,
        kelas: kelas,
        jurusan: jurusan,
      ),
    );

    notifyListeners();
  }
}
