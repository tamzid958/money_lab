import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/models/costLists.dart';

class CostList extends StatelessWidget {
  final CostLists costList;
  const CostList({Key key, this.costList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListTile(
        leading: Icon(
          costList.posMin == true
              ? Icons.add_circle_outline_rounded
              : Icons.remove_circle_outline,
          color: costList.posMin == true ? kGreenColor : kRedLightColor,
        ),
        title: Text(
          costList.title,
        ),
        trailing: Text(costList.currencyCode + " " + costList.money.toString()),
        onLongPress: () => {},
      ),
    ]);
  }
}
