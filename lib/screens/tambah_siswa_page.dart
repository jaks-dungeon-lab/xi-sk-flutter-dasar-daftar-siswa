import 'package:daftar_siswa/providers/siswa_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TambahSiswaPage extends StatefulWidget {
  const TambahSiswaPage({super.key});

  @override
  State<TambahSiswaPage> createState() => _TambahSiswaPageState();
}

class _TambahSiswaPageState extends State<TambahSiswaPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _jurusanController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();

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
              const SizedBox(height: 16),
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
              const SizedBox(height: 32),
              // Tombol Simpan
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    String nama = _namaController.text;
                    String jurusan = _jurusanController.text;
                    String kelas = _kelasController.text;

                    context.read<SiswaProvider>().tambahSiswa(
                      nama,
                      jurusan,
                      kelas,
                    );

                    Navigator.pop(context);
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
