import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart'; // Import package resmi penghubung platform
import 'tabel_siswa.dart'; // Import desain tabel yang kita buat sebelumnya
import 'package:daftar_siswa/models/siswa.dart'; // Wajib diimport agar generator mengenali kelas Siswa

// 1. Tambahkan Part yang akan di-generate otomatis nanti
part 'database.g.dart';

// 2. Beritahu Drift bahwa tabel yang akan dimasukkan ke database adalah SiswaTabel
@DriftDatabase(tables: [SiswaTabel])
class AppDatabase extends _$AppDatabase {
  // 3. Panggil fungsi koneksi di bawah saat database pertama kali diinisialisasi
  AppDatabase() : super(_bukaKoneksi());

  // 4. Tentukan Versi Database (Mulai dari 1)
  @override
  int get schemaVersion => 1;

  // ============================================
  // OPERASI CRUD
  // ============================================

  // 1. CREATE: Menambahkan siswa baru (Mirip: INSERT INTO)
  // Kembalian berupa int, yaitu ID auto-increment dari data yang baru masuk
  Future<int> insertSiswa(SiswaTabelCompanion siswaBaru) {
    return into(siswaTabel).insert(siswaBaru);
  }

  // 2. READ: Mengambil SELURUH daftar siswa (Mirip: SELECT * FROM)
  // Kembalian berupa List berisikan cetakan Siswa asli (berkat @UseRowClass)
  Future<List<Siswa>> getAllSiswa() {
    return select(siswaTabel).get();
  }

  // 3. UPDATE: Mengubah data siswa yang sudah ada
  // Kembalian bool, bernilai true jika berhasil ter-update
  Future<bool> updateSiswa(Siswa siswaLama) {
    return update(siswaTabel).replace(siswaLama.toInsertable());
  }

  // 4. DELETE: Menghapus data siswa berdasarkan data yang dikirim
  // Kembalian int, menandakan jumlah baris yang terhapus (biasanya 1)
  Future<int> deleteSiswa(Siswa siswaHapus) {
    return delete(siswaTabel).delete(siswaHapus.toInsertable());
  }
}

// 5. Fungsi koneksi mutakhir (Otomatis mendeteksi Android atau Web)
QueryExecutor _bukaKoneksi() {
  return driftDatabase(
    name: 'db_sekolah',
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.dart.js'),
    ),
  );
}
