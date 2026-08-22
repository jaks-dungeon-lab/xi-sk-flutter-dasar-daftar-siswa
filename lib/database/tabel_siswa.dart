import 'package:drift/drift.dart';
import '../models/siswa.dart'; // Import model asli kita

// 1. Membuat rancangan Tabel (Harus extends Table)
// 2. Gunakan stiker @UseRowClass agar Drift mencetak objek Siswa asli, bukan membuat kelas duplikat
@UseRowClass(Siswa, generateInsertable: true)
class SiswaTabel extends Table {
  // 2. Kolom ID sebagai Primary Key yang Auto Increment (bertambah otomatis 1, 2, 3...)
  IntColumn get id => integer().autoIncrement()();

  // 3. Kolom Teks biasa, panjang maksimal 50 karakter
  TextColumn get nama => text().withLength(max: 50)();

  // 4. Kolom NIS (Harus Unik, tidak boleh ada NIS kembar)
  TextColumn get nis => text().unique()();

  // 5. Kolom lainnya
  TextColumn get kelas => text()();
  TextColumn get jurusan => text()();
}
