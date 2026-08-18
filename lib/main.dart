import 'package:daftar_siswa/providers/siswa_provider.dart';
import 'package:flutter/material.dart';
import 'package:daftar_siswa/screens/halaman_daftar_siswa.dart';
import 'package:provider/provider.dart'; // 1. Wajib Import!

void main() => runApp(const AplikasiAbsenSiswa());

class AplikasiAbsenSiswa extends StatelessWidget {
  const AplikasiAbsenSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Bungkus MaterialApp dengan ChangeNotifierProvider
    return ChangeNotifierProvider(
      create: (context) => SiswaProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Buku Absen',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home: const HalamanDaftarSiswa(),
      ),
    );
  }
}
