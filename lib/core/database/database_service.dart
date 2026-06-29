import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

/// SQLite Database Service for completely offline local storage.
class DatabaseService {
  static const String _databaseName = 'aura_gold.db';
  static const int _databaseVersion = 2;

  Database? _database;

  DatabaseService._privateConstructor();

  static final DatabaseService instance = DatabaseService._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE assets (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        category TEXT NOT NULL,
        weight REAL NOT NULL,
        karat TEXT NOT NULL,
        notes TEXT NOT NULL,
        status TEXT NOT NULL,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE audit_logs (
        id TEXT PRIMARY KEY,
        asset_id TEXT NOT NULL,
        timestamp INTEGER NOT NULL,
        action TEXT NOT NULL,
        details TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE captured_media (
        id TEXT PRIMARY KEY,
        asset_id TEXT NOT NULL,
        media_type TEXT NOT NULL,
        file_path TEXT NOT NULL,
        created_at INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE risk_assessments (
        id TEXT PRIMARY KEY,
        asset_id TEXT NOT NULL,
        anomaly_score REAL NOT NULL,
        confidence REAL NOT NULL,
        decision TEXT NOT NULL,
        created_at INTEGER NOT NULL
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('DROP TABLE IF EXISTS audit_logs');
      await db.execute('DROP TABLE IF EXISTS assets');
      await db.execute('DROP TABLE IF EXISTS risk_decisions');
      await _onCreate(db, newVersion);
    }
  }

  // NEW METHOD
  Future<void> saveCapturedMedia({
    required String assetId,
    required String mediaType,
    required String filePath,
  }) async {
    final db = await database;

    await db.insert(
      'captured_media',
      {
        'id': const Uuid().v4(),
        'asset_id': assetId,
        'media_type': mediaType,
        'file_path': filePath,
        'created_at': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<void> close() async {
    final db = _database;
    if (db != null && db.isOpen) {
      await db.close();
      _database = null;
    }
  }
}