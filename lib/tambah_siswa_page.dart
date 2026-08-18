import 'package:flutter/material.dart';

class TambahSiswaPage extends StatefulWidget {
  const TambahSiswaPage({super.key});

  @override
  State<TambahSiswaPage> createState() => _TambahSiswaPageState();
}

class _TambahSiswaPageState extends State<TambahSiswaPage> {
  // 1. Deklarasi Mandor Form
  final _formKey = GlobalKey<FormState>();

  // 2. Deklarasi Controller untuk menangkap data
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _jurusanController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();

  // Jangan lupa hancurkan controller demi performa!
  @override
  void dispose() {
    _namaController.dispose();
    _jurusanController.dispose();
    _kelasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Siswa Baru')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // 3. Bungkus semuanya dengan Form
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Kolom Nama
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16), // Jarak antar kotak
              // Kolom Jurusan
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _jurusanController,
                decoration: const InputDecoration(
                  labelText: 'Jurusan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jurusan wajib diisi!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Kolom Kelas
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _kelasController,
                decoration: const InputDecoration(
                  labelText: 'Kelas',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kelas tidak boleh kosong!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32), // Jarak sebelum tombol
              // Tombol Simpan
              ElevatedButton(
                onPressed: () {
                  // 4. Mengecek Status Validasi dengan aman (?.)
                  if (_formKey.currentState?.validate() ?? false) {
                    // Jika lolos validasi, tangkap datanya
                    String nama = _namaController.text;
                    String jurusan = _jurusanController.text;
                    String kelas = _kelasController.text;

                    // Kita tampilkan Pop-up (Dialog)
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Data Diterima!'),
                          content: Text(
                            'Siswa baru bernama $nama dari kelas $kelas ($jurusan) siap ditambahkan ke sistem.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Tutup pop-up
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Simpan Siswa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
