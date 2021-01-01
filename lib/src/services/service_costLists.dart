import 'package:money_lab/src/utils/database.dart';
import 'package:money_lab/src/models/costLists.new.dart';

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
}
