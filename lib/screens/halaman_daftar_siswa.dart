import 'package:daftar_siswa/models/siswa.dart';
import 'package:daftar_siswa/providers/siswa_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tambah_siswa_page.dart';

class HalamanDaftarSiswa extends StatefulWidget {
  const HalamanDaftarSiswa({super.key});

  @override
  State<HalamanDaftarSiswa> createState() => _HalamanDaftarSiswaState();
}

class _HalamanDaftarSiswaState extends State<HalamanDaftarSiswa> {
  // 1. HAPUS variabel semuaSiswa dan fungsi initState yang lama!

  // 2. Buat variabel baru untuk menyimpan teks pencarian (kata kunci)
  String _kataKunci = '';

  // 3. Ubah fungsi cariSiswa agar HANYA menyimpan kata kunci saja
  void cariSiswa(String teks) {
    setState(() {
      _kataKunci = teks;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 4. MENDENGARKAN SIARAN PENYIAR
    final providerSiswa = context.watch<SiswaProvider>();

    // 5. MENYARING DATA SECARA OTOMATIS
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
        backgroundColor: Colors.indigo.shade50,
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
                fillColor: Colors.indigo.shade50,
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
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.indigo.shade100),
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
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
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
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
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
        backgroundColor: Colors.indigo.shade50,
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
            const Text(
              'Siswa Kelas XI RPL 1',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
