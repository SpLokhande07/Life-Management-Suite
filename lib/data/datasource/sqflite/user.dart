import 'package:sqflite/sqflite.dart';
import 'package:taskflow/data/datasource/sqflite/sqflite_local_db.dart';

class TaskDb extends SqfliteLocalDb {
  Future<void> insertTask(String title, String description, int userId) async {
    final db = await SqfliteLocalDb.database;
    if (db == null) return;

    await db.insert(
      'Task',
      {
        'title': title,
        'description': description,
        'userId': userId,
        'isComplete': 0
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getTasksByUser(int userId) async {
    final db = await SqfliteLocalDb.database;
    if (db == null) return [];

    return await db.query('Task', where: 'userId = ?', whereArgs: [userId]);
  }

  Future<void> updateTaskStatus(int taskId, bool isComplete) async {
    final db = await SqfliteLocalDb.database;
    if (db == null) return;

    await db.update(
      'Task',
      {'isComplete': isComplete ? 1 : 0},
      where: 'id = ?',
      whereArgs: [taskId],
    );
  }

  Future<void> deleteTask(int taskId) async {
    final db = await SqfliteLocalDb.database;
    if (db == null) return;

    await db.delete('Task', where: 'id = ?', whereArgs: [taskId]);
  }
}
