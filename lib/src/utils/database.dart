import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'money_lab.db'),
      onCreate: (db, version) async {
        await db.execute('''
 CREATE TABLE "costlists" (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
	"title"	TEXT NOT NULL,
	"time"	NUMERIC NOT NULL,
	"notes"	TEXT,
	"money"	NUMERIC NOT NULL,
	"posMin"	INTEGER NOT NULL
);

     CREATE TABLE "budgetlist" (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
	"title"	TEXT NOT NULL,
	"month"	TEXT NOT NULL,
	"income"	NUMERIC NOT NULL,
	"target"	NUMERIC NOT NULL,
	"expend"	NUMERIC NOT NULL
);
CREATE UNIQUE INDEX "budgetId" ON "budgetlist" (
	"id"
);
CREATE UNIQUE INDEX "costId" ON "costlists" (
	"id"
);
     ''');
      },
      version: 1,
    );
  }

  newCost(newCost) async {
    final db = await database;
    var costLists = await db.rawInsert(
      '''
    INSERT INTO `costlists` (id, title, time, notes, money, posMin) VALUES (?,?,?,?,?,?);
    ''',
      [
        null,
        newCost.title,
        newCost.time,
        newCost.notes,
        newCost.money,
        newCost.posMin
      ],
    );
    return costLists;
  }

  Future<dynamic> get getCost async {
    final db = await database;
    var costLists = await db.query("costlists");
    if (costLists.length == 0) {
      return null;
    }
    var costListsMap = costLists[0];
    return costLists.isNotEmpty ? costListsMap : Null;
  }
}
