// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SiswaTabelTable extends SiswaTabel
    with TableInfo<$SiswaTabelTable, Siswa> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SiswaTabelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama = GeneratedColumn<String>(
    'nama',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nisMeta = const VerificationMeta('nis');
  @override
  late final GeneratedColumn<String> nis = GeneratedColumn<String>(
    'nis',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _kelasMeta = const VerificationMeta('kelas');
  @override
  late final GeneratedColumn<String> kelas = GeneratedColumn<String>(
    'kelas',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jurusanMeta = const VerificationMeta(
    'jurusan',
  );
  @override
  late final GeneratedColumn<String> jurusan = GeneratedColumn<String>(
    'jurusan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nama, nis, kelas, jurusan];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'siswa_tabel';
  @override
  VerificationContext validateIntegrity(
    Insertable<Siswa> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama')) {
      context.handle(
        _namaMeta,
        nama.isAcceptableOrUnknown(data['nama']!, _namaMeta),
      );
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('nis')) {
      context.handle(
        _nisMeta,
        nis.isAcceptableOrUnknown(data['nis']!, _nisMeta),
      );
    } else if (isInserting) {
      context.missing(_nisMeta);
    }
    if (data.containsKey('kelas')) {
      context.handle(
        _kelasMeta,
        kelas.isAcceptableOrUnknown(data['kelas']!, _kelasMeta),
      );
    } else if (isInserting) {
      context.missing(_kelasMeta);
    }
    if (data.containsKey('jurusan')) {
      context.handle(
        _jurusanMeta,
        jurusan.isAcceptableOrUnknown(data['jurusan']!, _jurusanMeta),
      );
    } else if (isInserting) {
      context.missing(_jurusanMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Siswa map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Siswa(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nama: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama'],
      )!,
      nis: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nis'],
      )!,
      kelas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kelas'],
      )!,
      jurusan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jurusan'],
      )!,
    );
  }

  @override
  $SiswaTabelTable createAlias(String alias) {
    return $SiswaTabelTable(attachedDatabase, alias);
  }
}

class SiswaTabelCompanion extends UpdateCompanion<Siswa> {
  final Value<int> id;
  final Value<String> nama;
  final Value<String> nis;
  final Value<String> kelas;
  final Value<String> jurusan;
  const SiswaTabelCompanion({
    this.id = const Value.absent(),
    this.nama = const Value.absent(),
    this.nis = const Value.absent(),
    this.kelas = const Value.absent(),
    this.jurusan = const Value.absent(),
  });
  SiswaTabelCompanion.insert({
    this.id = const Value.absent(),
    required String nama,
    required String nis,
    required String kelas,
    required String jurusan,
  }) : nama = Value(nama),
       nis = Value(nis),
       kelas = Value(kelas),
       jurusan = Value(jurusan);
  static Insertable<Siswa> custom({
    Expression<int>? id,
    Expression<String>? nama,
    Expression<String>? nis,
    Expression<String>? kelas,
    Expression<String>? jurusan,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nama != null) 'nama': nama,
      if (nis != null) 'nis': nis,
      if (kelas != null) 'kelas': kelas,
      if (jurusan != null) 'jurusan': jurusan,
    });
  }

  SiswaTabelCompanion copyWith({
    Value<int>? id,
    Value<String>? nama,
    Value<String>? nis,
    Value<String>? kelas,
    Value<String>? jurusan,
  }) {
    return SiswaTabelCompanion(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      nis: nis ?? this.nis,
      kelas: kelas ?? this.kelas,
      jurusan: jurusan ?? this.jurusan,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (nis.present) {
      map['nis'] = Variable<String>(nis.value);
    }
    if (kelas.present) {
      map['kelas'] = Variable<String>(kelas.value);
    }
    if (jurusan.present) {
      map['jurusan'] = Variable<String>(jurusan.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SiswaTabelCompanion(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('nis: $nis, ')
          ..write('kelas: $kelas, ')
          ..write('jurusan: $jurusan')
          ..write(')'))
        .toString();
  }
}

class _$SiswaInsertable implements Insertable<Siswa> {
  Siswa _object;
  _$SiswaInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return SiswaTabelCompanion(
      id: Value(_object.id),
      nama: Value(_object.nama),
      nis: Value(_object.nis),
      kelas: Value(_object.kelas),
      jurusan: Value(_object.jurusan),
    ).toColumns(false);
  }
}

extension SiswaToInsertable on Siswa {
  _$SiswaInsertable toInsertable() {
    return _$SiswaInsertable(this);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SiswaTabelTable siswaTabel = $SiswaTabelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [siswaTabel];
}

typedef $$SiswaTabelTableCreateCompanionBuilder =
    SiswaTabelCompanion Function({
      Value<int> id,
      required String nama,
      required String nis,
      required String kelas,
      required String jurusan,
    });
typedef $$SiswaTabelTableUpdateCompanionBuilder =
    SiswaTabelCompanion Function({
      Value<int> id,
      Value<String> nama,
      Value<String> nis,
      Value<String> kelas,
      Value<String> jurusan,
    });

class $$SiswaTabelTableFilterComposer
    extends Composer<_$AppDatabase, $SiswaTabelTable> {
  $$SiswaTabelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nis => $composableBuilder(
    column: $table.nis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kelas => $composableBuilder(
    column: $table.kelas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jurusan => $composableBuilder(
    column: $table.jurusan,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SiswaTabelTableOrderingComposer
    extends Composer<_$AppDatabase, $SiswaTabelTable> {
  $$SiswaTabelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nis => $composableBuilder(
    column: $table.nis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kelas => $composableBuilder(
    column: $table.kelas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jurusan => $composableBuilder(
    column: $table.jurusan,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SiswaTabelTableAnnotationComposer
    extends Composer<_$AppDatabase, $SiswaTabelTable> {
  $$SiswaTabelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nama =>
      $composableBuilder(column: $table.nama, builder: (column) => column);

  GeneratedColumn<String> get nis =>
      $composableBuilder(column: $table.nis, builder: (column) => column);

  GeneratedColumn<String> get kelas =>
      $composableBuilder(column: $table.kelas, builder: (column) => column);

  GeneratedColumn<String> get jurusan =>
      $composableBuilder(column: $table.jurusan, builder: (column) => column);
}

class $$SiswaTabelTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SiswaTabelTable,
          Siswa,
          $$SiswaTabelTableFilterComposer,
          $$SiswaTabelTableOrderingComposer,
          $$SiswaTabelTableAnnotationComposer,
          $$SiswaTabelTableCreateCompanionBuilder,
          $$SiswaTabelTableUpdateCompanionBuilder,
          (Siswa, BaseReferences<_$AppDatabase, $SiswaTabelTable, Siswa>),
          Siswa,
          PrefetchHooks Function()
        > {
  $$SiswaTabelTableTableManager(_$AppDatabase db, $SiswaTabelTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SiswaTabelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SiswaTabelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SiswaTabelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nama = const Value.absent(),
                Value<String> nis = const Value.absent(),
                Value<String> kelas = const Value.absent(),
                Value<String> jurusan = const Value.absent(),
              }) => SiswaTabelCompanion(
                id: id,
                nama: nama,
                nis: nis,
                kelas: kelas,
                jurusan: jurusan,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nama,
                required String nis,
                required String kelas,
                required String jurusan,
              }) => SiswaTabelCompanion.insert(
                id: id,
                nama: nama,
                nis: nis,
                kelas: kelas,
                jurusan: jurusan,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SiswaTabelTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SiswaTabelTable,
      Siswa,
      $$SiswaTabelTableFilterComposer,
      $$SiswaTabelTableOrderingComposer,
      $$SiswaTabelTableAnnotationComposer,
      $$SiswaTabelTableCreateCompanionBuilder,
      $$SiswaTabelTableUpdateCompanionBuilder,
      (Siswa, BaseReferences<_$AppDatabase, $SiswaTabelTable, Siswa>),
      Siswa,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SiswaTabelTableTableManager get siswaTabel =>
      $$SiswaTabelTableTableManager(_db, _db.siswaTabel);
}
