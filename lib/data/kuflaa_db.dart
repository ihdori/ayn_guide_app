import 'package:ayn/data/local_database/models/kafeel_data_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class KufalaaDatabaseHelper {
  static final KufalaaDatabaseHelper _instance =
      KufalaaDatabaseHelper._internal();
  static Database? _database;

  KufalaaDatabaseHelper._internal();

  factory KufalaaDatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database == null || !_database!.isOpen) {
      _database = await _initDatabase();
    }
    return _database!;
  }

  // Initialize database and create tables
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'tax_collection_database.db');

    return await openDatabase(path, version: 1, onCreate: _createTables);
  }

  // Create tables
  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE all_kufalaa (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        kafeel_name TEXT NOT NULL,
        kafeel_address TEXT NOT NULL,
        kafeel_phone_number TEXT NOT NULL,
        is_has_debt INTEGER DEFAULT 0,
        Kafeel_debt_amount INTEGER,
        kafeel_monthly_payment INTEGER NOT NULL,
        date_of_contact INTEGER ,
        created_at TEXT NOT NULL,
        updated_at TEXT,
        last_contact_date TEXT,
category_id INTEGER DEFAULT 1
      )
    ''');

    //     await db.execute('''
    // CREATE TABLE kafeel_catigory(
    //   id INTEGER PRIMARY KEY AUTOINCREMENT,
    //   catigory_name TEXT
    // )
    // ''');

    //     intCatigoryData() async {
    //       Database? db = await database;
    //       int response = await db.rawInsert('''
    // INSEERT INTO kafeel_catigory (catigory_name)
    // VALUES (
    // "في الانتظار",
    // "تم التواصل",
    // )
    // ''');
    //       return response;
    //     }

    //     await intCatigoryData();
    await db.execute('''
      CREATE TABLE contacted_this_month (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      kafeel_id INTEGER NOT NULL,
      contact_date TEXT NOT NULL,
      FOREIGN KEY (kafeel_id) REFERENCES all_kufalaa(id)
    );
    ''');

    await db.execute('''
      CREATE TABLE remaining_kufalaa (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      kafeel_id INTEGER NOT NULL,
      added_date TEXT NOT NULL,
      FOREIGN KEY (kafeel_id) REFERENCES all_kufalaa(id)
    );
    ''');

    await db.execute('''
      CREATE TABLE kufalaa_with_debt (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      kafeel_id INTEGER NOT NULL,
      total_debt INTEGER NOT NULL DEFAULT 0,
      last_update TEXT NOT NULL,
      FOREIGN KEY (kafeel_id) REFERENCES all_kufalaa(id)
    );
    ''');
    // Create indexes for better query performance
    await db.execute('''
      CREATE INDEX idx_kafeel_name ON all_kufalaa(kafeel_name)
    ''');

    await db.execute('''
      CREATE INDEX idx_date_of_contact ON all_kufalaa(date_of_contact)
    ''');

    await db.execute('''
      CREATE INDEX idx_is_has_debt ON all_kufalaa(is_has_debt)
    ''');

    // await db.execute('''
    //   CREATE INDEX idx_is_completed ON all_kufalaa(is_completed)
    // ''');
  }

  // CRUD Operations
  read(String sql) async {
    Database? db = await database;
    List<Map> response = await db.rawQuery(sql);
    return response;
  }

  insert(String sql) async {
    Database? db = await database;
    int response = await db.rawInsert(sql);
    return response;
  }

  update(String sql) async {
    Database? db = await database;
    int response = await db.rawUpdate(sql);
    return response;
  }

  delete(String sql) async {
    Database? db = await database;
    int response = await db.rawDelete(sql);
    return response;
  }

  // Create - Insert new Kafeel
  Future<int> insertNewKafeel(Kafeel kafeel) async {
    final db = await database;
    return await db.insert('all_kufalaa', kafeel.toMap());
  }

  Future<void> markKafeelAsContacted(int kafeelId, Database db) async {
    final today = DateTime.now().toIso8601String();

    await db.insert('contacted_this_month', {
      'kafeel_id': kafeelId,
      'contact_date': today,
    });

    await db.delete(
      'remaining_kufalaa',
      where: 'kafeel_id = ?',
      whereArgs: [kafeelId],
    );
  }

  getRemainingKufalaaCount() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM remaining_kufalaa',
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  // // Read - Get all Kufalaa
  // Future<List<Kafeel>> getAllKufalaa() async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> maps = await db.query(
  //     'all_kufalaa',
  //     orderBy: 'kafeel_name ASC',
  //   );
  //   return List.generate(maps.length, (i) => Kafeel.fromMap(maps[i]));
  // }

  // // Read - Get Kafeel by ID
  // Future<Kafeel?> getKafeelById(int id) async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> maps = await db.query(
  //     'tax_todos',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );

  //   if (maps.isNotEmpty) {
  //     return Kafeel.fromMap(maps.first);
  //   }
  //   return null;
  // }
}
