import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/siswa_provider.dart';
import 'providers/tema_provider.dart'; // Import penyiar tema
import 'screens/halaman_daftar_siswa.dart';

void main() => runApp(const AplikasiAbsenSiswa());

class AplikasiAbsenSiswa extends StatelessWidget {
  const AplikasiAbsenSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    // Gunakan MultiProvider jika punya lebih dari 1 penyiar
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SiswaProvider()),
        ChangeNotifierProvider(create: (context) => TemaProvider()),
      ],
      // Gunakan Consumer untuk memantau TemaProvider agar MaterialApp bisa berganti warna
      child: Consumer<TemaProvider>(
        builder: (context, temaProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Buku Absen',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: temaProvider.isDarkMode
                  ? const ColorScheme.dark(
                      primary: Color(0xFF818CF8), // Indigo 400
                      surface: Color(0xFF09090B), // Zinc 950
                      onSurface: Color(0xFFFAFAFA), // Zinc 50
                      surfaceContainerHighest: Color(0xFF18181B), // Zinc 900
                      onSurfaceVariant: Color(0xFFA1A1AA), // Zinc 400
                      outlineVariant: Color(0xFF27272A), // Zinc 800
                    )
                  : ColorScheme.fromSeed(
                      seedColor: Colors.indigo,
                      brightness: Brightness.light,
                    ),
              scaffoldBackgroundColor: temaProvider.isDarkMode
                  ? const Color(0xFF09090B)
                  : null,
            ),
            home: const HalamanDaftarSiswa(),
          );
        },
      ),
    );
  }
}
