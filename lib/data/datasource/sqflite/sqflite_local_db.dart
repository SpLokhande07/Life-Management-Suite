import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteLocalDb {
  static Database? _db;
  final int _version = 1;
  final String _dbName = "taskflow";

  static Future<Database?> get database async {
    if (_db != null) return _db;
    SqfliteLocalDb instance = SqfliteLocalDb();
    _db = await instance._initDb();
    return _db;
  }

  Future<Database> _initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, '$_dbName+_db.db');
    return openDatabase(
      path,
      version: _version,
      onCreate: (db, version) async {
        await db.execute(_createUserTableQuery());
        await db.execute(_createTaskTableQuery());
      },
    );
  }

  // Function to create the User table
  static String _createUserTableQuery() {
    return '''
    CREATE TABLE User (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT NOT NULL UNIQUE
    )
  ''';
  }

  // Function to create the Task table
  static String _createTaskTableQuery() {
    return '''
    CREATE TABLE Task (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      description TEXT,
      isComplete INTEGER NOT NULL DEFAULT 0,
      userId INTEGER NOT NULL,
      FOREIGN KEY(userId) REFERENCES User(id) ON DELETE CASCADE
    )
  ''';
  }
}
