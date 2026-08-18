import 'package:flutter/material.dart';
import 'tambah_siswa_page.dart';

void main() => runApp(const AplikasiAbsenSiswa());

class AplikasiAbsenSiswa extends StatelessWidget {
  const AplikasiAbsenSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buku Absen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HalamanDaftarSiswa(),
    );
  }
}

class HalamanDaftarSiswa extends StatefulWidget {
  const HalamanDaftarSiswa({super.key});

  @override
  State<HalamanDaftarSiswa> createState() => _HalamanDaftarSiswaState();
}

class _HalamanDaftarSiswaState extends State<HalamanDaftarSiswa> {
  final List<String> semuaSiswa = [
    'BUDI SANTOSO',
    'AYU LESTARI',
    'SITI NURHALIZA',
    'ANDI FIRMANSYAH',
    'JOKO SUSILO',
    'DIANA PUTRI',
  ];
  List<String> siswaDitampilkan = [];

  @override
  void initState() {
    super.initState();
    siswaDitampilkan = semuaSiswa;
  }

  void cariSiswa(String teks) {
    setState(() {
      siswaDitampilkan = teks.isEmpty
          ? semuaSiswa
          : semuaSiswa
                .where((n) => n.toLowerCase().contains(teks.toLowerCase()))
                .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      siswaDitampilkan[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text('NIS: 102030${index + 1}  •  XI RPL 1'),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HalamanDetailSiswa(
                            namaSiswa: siswaDitampilkan[index],
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
            MaterialPageRoute(
              builder: (context) => const TambahSiswaPage(),
            ),
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
