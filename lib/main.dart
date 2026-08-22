import 'package:daftar_siswa/database/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/siswa_provider.dart';
import 'providers/tema_provider.dart';
import 'screens/halaman_daftar_siswa.dart';

final databaseUtama = AppDatabase();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const AplikasiAbsenSiswa());
}

class AplikasiAbsenSiswa extends StatelessWidget {
  const AplikasiAbsenSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SiswaProvider(databaseUtama),
        ),
        ChangeNotifierProvider(create: (context) => TemaProvider()),
      ],
      child: Consumer<TemaProvider>(
        builder: (context, temaProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Buku Absen',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: temaProvider.isDarkMode
                  ? const ColorScheme.dark(
                      primary: Color(0xFF818CF8),
                      surface: Color(0xFF09090B),
                      onSurface: Color(0xFFFAFAFA),
                      surfaceContainerHighest: Color(0xFF18181B),
                      onSurfaceVariant: Color(0xFFA1A1AA),
                      outlineVariant: Color(0xFF27272A),
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
