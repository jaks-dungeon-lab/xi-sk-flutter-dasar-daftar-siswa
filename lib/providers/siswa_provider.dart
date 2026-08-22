import 'package:daftar_siswa/database/database.dart';
import 'package:daftar_siswa/models/siswa.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart'; // Dibutuhkan untuk Value()

class SiswaProvider with ChangeNotifier {
  // 1. Tangkap suntikan database dari main.dart
  final AppDatabase _db;

  SiswaProvider(this._db) {
    // 2. Begitu Provider lahir, langsung suruh ia mengambil isi tabel (SELECT)
    _muatDataDariDatabase();
  }

  // 3. Keranjang kosong khusus menyimpan objek asli Siswa
  List<Siswa> _semuaSiswa = [];
  List<Siswa> get semuaSiswa => _semuaSiswa;

  // ============================
  // LOGIKA PENGAMBILAN DATA
  // ============================
  Future<void> _muatDataDariDatabase() async {
    // Panggil fungsi READ yang kita buat di AppDatabase
    final dataDariTabel = await _db.getAllSiswa();

    _semuaSiswa = dataDariTabel;

    // Perintahkan layar untuk update!
    notifyListeners();
  }

  // ============================
  // LOGIKA MENAMBAHKAN DATA
  // ============================
  Future<void> tambahSiswa(String nama, String jurusan, String kelas) async {
    String nisBaru = '102030${_semuaSiswa.length + 1}';

    // Bungkus ke dalam "Companion" (Kerangka kosong tanpa ID)
    // Ingat membungkus nilai aslinya menggunakan Value(...)
    final siswaBaru = SiswaTabelCompanion(
      nama: Value(nama.toUpperCase()),
      nis: Value(nisBaru),
      kelas: Value(kelas),
      jurusan: Value(jurusan),
    );

    // Lempar ke fungsi INSERT di AppDatabase
    await _db.insertSiswa(siswaBaru);

    // Jangan lupa suruh Provider muat ulang seluruh tabel ke keranjang
    await _muatDataDariDatabase();
  }

  // ============================
  // LOGIKA UPDATE & DELETE
  // ============================
  Future<void> editSiswa(Siswa siswaYangDiedit) async {
    // Lempar model Siswa utuh ke AppDatabase (di sana sudah ditangani .toInsertable())
    await _db.updateSiswa(siswaYangDiedit);
    await _muatDataDariDatabase();
  }

  // Fungsi hapus (Delete)
  Future<void> hapusSiswa(Siswa siswaYangDihapus) async {
    await _db.deleteSiswa(siswaYangDihapus);
    await _muatDataDariDatabase();
  }
}
