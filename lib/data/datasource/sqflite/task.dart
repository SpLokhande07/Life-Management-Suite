import 'package:sqflite/sqflite.dart';
import 'package:taskflow/data/datasource/sqflite/sqflite_local_db.dart';

class UserDb extends SqfliteLocalDb {
  Future<void> insertUser(String name, String email) async {
    final db = await SqfliteLocalDb.database;
    if (db == null) return;

    await db.insert(
      'User',
      {'name': name, 'email': email},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await SqfliteLocalDb.database;
    if (db == null) return [];

    return await db.query('User');
  }

  Future<void> deleteUser(int userId) async {
    final db = await SqfliteLocalDb.database;
    if (db == null) return;

    await db.delete('User', where: 'id = ?', whereArgs: [userId]);
  }
}
