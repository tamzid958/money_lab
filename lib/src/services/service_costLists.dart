import 'package:money_lab/src/utils/database.dart';
import 'package:money_lab/src/models/costLists.new.dart';

import 'datformatter.dart';

class ServiceCostList {
  static Future<List<CostLists>> getAllCosts() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.costListTable}''';
    final data = await db.rawQuery(sql);
    List<CostLists> costlists = List();

    for (final node in data) {
      final costlist = CostLists.fromJSON(node);
      costlists.add(costlist);
    }
    return costlists;
  }

  static Future<List<CostLists>> getSearchCosts(searchTitle) async {
    final sql =
        '''SELECT * FROM ${DatabaseCreator.costListTable} WHERE ${DatabaseCreator.title} LIKE '$searchTitle%' ''';
    final data = await db.rawQuery(sql);
    List<CostLists> costlists = List();

    for (final node in data) {
      final costlist = CostLists.fromJSON(node);
      costlists.add(costlist);
    }
    return costlists;
  }

  static Future<CostLists> getCost(int id) async {
    final sql =
        '''SELECT * FROM ${DatabaseCreator.costListTable} WHERE ${DatabaseCreator.id} == $id''';
    final data = await db.rawQuery(sql);
    final costlist = CostLists.fromJSON(data[0]);
    return costlist;
  }

  static Future<void> addCost(CostLists costlist) async {
    final sql = ''' 
    INSERT INTO  ${DatabaseCreator.costListTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.title},
      ${DatabaseCreator.time},
      ${DatabaseCreator.notes},
      ${DatabaseCreator.money},
      ${DatabaseCreator.posMin}
    )
    VALUES
    (
      ${costlist.id},
      "${costlist.title}",
      "${costlist.time}",
      "${costlist.notes}",
      ${costlist.money},
      ${costlist.posMin ? 1 : 0}
    )
    ''';
    final result = await db.rawInsert(sql);
    DatabaseCreator.databaseLog('Add CostList', sql, null, result);
  }

  static Future<void> deleteCost(int id) async {
    final sql = '''
    DELETE FROM ${DatabaseCreator.costListTable}
    WHERE ${DatabaseCreator.id} == $id
    ''';

    await db.rawDelete(sql);
  }

  static Future<void> updateCost(CostLists costList) async {
    final sql = '''UPDATE ${DatabaseCreator.costListTable}
    SET ${DatabaseCreator.title} = ?,
    ${DatabaseCreator.money} = ?,
    ${DatabaseCreator.notes} = ?
    WHERE ${DatabaseCreator.id} = ?
    ''';

    List<dynamic> params = [
      costList.title,
      costList.money,
      costList.notes,
      costList.id
    ];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Update CostList', sql, null, result);
  }

  static Future<int> costCount() async {
    final data = await db
        .rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.costListTable}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }

  static Future<List<Map<String, dynamic>>> getAllSumCost() async {
    var date = DateTime.now().toString();
    date = DateFormater.convertDateTimeDisplay(date);
    date = date.substring(6);
    final sql =
        ''' SELECT ${DatabaseCreator.posMin}, SUM(${DatabaseCreator.money}), 
    SUM(${DatabaseCreator.money}) AS money FROM ${DatabaseCreator.costListTable} WHERE ${DatabaseCreator.time} LIKE '%$date'
    GROUP BY ${DatabaseCreator.posMin}''';
    final data = await db.rawQuery(sql);
    if (data.length == 0) {
      return null;
    }
    return data;
  }

  static Future<List<double>> getLastElevenCost() async {
    var date = DateTime.now().toString();
    date = DateFormater.convertDateTimeDisplay(date);
    date = date.substring(6);

    final sql =
        ''' SELECT ${DatabaseCreator.money} FROM ${DatabaseCreator.costListTable} WHERE ${DatabaseCreator.posMin} = 0 AND ${DatabaseCreator.time} LIKE '%$date' ORDER BY ${DatabaseCreator.id} DESC LIMIT 11''';
    final data = await db.rawQuery(sql);

    if (data.length == 0) {
      return null;
    }
    List<double> moneyArr = List(data.length);

    for (var i = 0; i < data.length; i++) {
      moneyArr[i] = data[i]["money"];
    }

    return moneyArr;
  }

  static Future<double> getProfileRemain() async {
    final incomeSql =
        ''' SELECT ${DatabaseCreator.money} FROM ${DatabaseCreator.costListTable} WHERE ${DatabaseCreator.posMin} = 1''';
    final incomedata = await db.rawQuery(incomeSql);

    final expendSql =
        ''' SELECT ${DatabaseCreator.money} FROM ${DatabaseCreator.costListTable} WHERE ${DatabaseCreator.posMin} = 0''';
    final expenddata = await db.rawQuery(expendSql);

    if (incomedata.length == 0 || expenddata.length == 0) {
      return null;
    }

    double remaining = incomedata[0]["money"] - expenddata[0]["money"];
    return remaining;
  }
}
