import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database db;

class DatabaseCreator {
  static const costListTable = 'costlists';
  static const id = 'id';
  static const title = 'title';
  static const time = 'time';
  static const notes = 'notes';
  static const money = 'money';
  static const posMin = 'posMin';
  static const costId = 'costId';

  static void databaseLog(String function, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult]) {
    print(function);
    print(sql);
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createCostListTable(Database db) async {
    final costListSql = '''
          CREATE TABLE $costListTable (
          $id	INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
          $title TEXT NOT NULL,
          $time	TEXT NOT NULL,
          $notes TEXT,
          $money	REAL NOT NULL,
          $posMin	BIT NOT NULL
          );
          CREATE UNIQUE INDEX $costId ON $costListTable (
          $id
          );
    ''';
    await db.execute(costListSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('money_lab');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createCostListTable(db);
  }
}
