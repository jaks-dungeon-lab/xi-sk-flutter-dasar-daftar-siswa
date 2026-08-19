import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TemaProvider with ChangeNotifier {
  // Secara default (bawaan), kita anggap tema terang (false)
  bool _isDarkMode = false;

  // Jendela kaca agar UI bisa melihat status tema saat ini
  bool get isDarkMode => _isDarkMode;

  // Saat provider pertama kali lahir, langsung cek memori HP!
  TemaProvider() {
    _muatTemaDariMemori();
  }

  // Fungsi untuk mengecek isi loker memori
  Future<void> _muatTemaDariMemori() async {
    final prefs = await SharedPreferences.getInstance();
    // Cari status tema. Jika loker kosong, anggap false (terang).
    _isDarkMode = prefs.getBool('mode_gelap') ?? false;
    // Beritahu layar untuk menyesuaikan diri
    notifyListeners();
  }

  // Fungsi yang dipanggil saat user menekan tombol Switch (Ganti Tema)
  Future<void> gantiTema() async {
    // Balikkan statusnya (Gelap jadi Terang, Terang jadi Gelap)
    _isDarkMode = !_isDarkMode;

    // Simpan status baru tersebut ke loker memori selamanya!
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('mode_gelap', _isDarkMode);

    // Teriakkan perubahan agar layar langsung berubah warna!
    notifyListeners();
  }
}
