import 'package:daftar_siswa/models/siswa.dart';
import 'package:daftar_siswa/providers/siswa_provider.dart';
import 'package:daftar_siswa/providers/tema_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tambah_siswa_page.dart';

class HalamanDaftarSiswa extends StatefulWidget {
  const HalamanDaftarSiswa({super.key});

  @override
  State<HalamanDaftarSiswa> createState() => _HalamanDaftarSiswaState();
}

class _HalamanDaftarSiswaState extends State<HalamanDaftarSiswa> {
  String _kataKunci = '';

  void cariSiswa(String teks) {
    setState(() {
      _kataKunci = teks;
    });
  }

  @override
  Widget build(BuildContext context) {
    final providerSiswa = context.watch<SiswaProvider>();

    List<Siswa> siswaDitampilkan = _kataKunci.isEmpty
        ? providerSiswa.semuaSiswa
        : providerSiswa.semuaSiswa
              .where(
                (s) => s.nama.toLowerCase().contains(_kataKunci.toLowerCase()),
              )
              .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buku Absen Kelas XI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          // Pantau status tema saat ini untuk ikon sakelarnya
          Consumer<TemaProvider>(
            builder: (context, temaProvider, child) {
              return Switch(
                value: temaProvider.isDarkMode, // Posisi sakelar (nyala/mati)
                onChanged: (value) {
                  // Perintah untuk mengganti tema dan menyimpannya ke memori
                  temaProvider.gantiTema();
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Kotak Pencarian
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: cariSiswa,
              decoration: InputDecoration(
                hintText: 'Cari nama siswa...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // 2. Daftar Siswa
          Expanded(
            child: ListView.builder(
              itemCount: siswaDitampilkan.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    title: Text(
                      siswaDitampilkan[index].nama,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'NIS: ${siswaDitampilkan[index].nis}  •  ${siswaDitampilkan[index].kelas} ${siswaDitampilkan[index].jurusan}',
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HalamanDetailSiswa(
                            namaSiswa: siswaDitampilkan[index].nama,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TambahSiswaPage()),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HalamanDetailSiswa extends StatelessWidget {
  final String namaSiswa;

  const HalamanDetailSiswa({super.key, required this.namaSiswa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Siswa'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            const SizedBox(height: 24),
            Text(
              namaSiswa,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Siswa Kelas XI RPL 1',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
