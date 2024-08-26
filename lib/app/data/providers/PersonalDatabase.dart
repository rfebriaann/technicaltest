import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/Personal.dart'; // Sesuaikan dengan lokasi file model data

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'personal_info.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE personal_info (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fullName TEXT,
        birthDate TEXT,
        gender TEXT,
        email TEXT,
        phoneNumber TEXT,
        lastEducation TEXT,
        address TEXT,
        province TEXT,
        city TEXT,
        pos TEXT,
        company TEXT,
        position TEXT,
        ktpImagePath TEXT
      )
    ''');
  }

  Future<void> insertPersonalInfo(PersonalInfo info) async {
    final db = await database;
    await db.insert('personal_info', info.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<PersonalInfo>> getPersonalInfo() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('personal_info');

    return List.generate(maps.length, (i) {
      return PersonalInfo(
        id: maps[i]['id'],
        fullName: maps[i]['fullName'],
        birthDate: maps[i]['birthDate'],
        gender: maps[i]['gender'],
        email: maps[i]['email'],
        phoneNumber: maps[i]['phoneNumber'],
        lastEducation: maps[i]['lastEducation'],
        address: maps[i]['address'],
        province: maps[i]['province'],
        city: maps[i]['city'],
        pos: maps[i]['pos'],
        company: maps[i]['company'],
        position: maps[i]['position'],
        ktpImagePath: maps[i]['ktpImagePath'],
      );
    });
  }
}
