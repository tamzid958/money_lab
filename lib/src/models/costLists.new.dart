import 'package:money_lab/src/utils/database.dart';

class CostLists {
  String title, time, notes;
  int id;
  double money;
  bool posMin;

  CostLists(
    this.id,
    this.title,
    this.time,
    this.money,
    this.posMin,
    this.notes,
  );

  CostLists.fromJSON(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.title = json[DatabaseCreator.title];
    this.time = json[DatabaseCreator.time];
    this.money = json[DatabaseCreator.money];
    this.posMin = json[DatabaseCreator.posMin] == 1;
    this.notes = json[DatabaseCreator.notes];
  }
}
