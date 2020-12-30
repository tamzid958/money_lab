import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/models/costLists.dart';

class CostList extends StatelessWidget {
  final CostLists costList;
  final Function press;
  const CostList({Key key, this.costList, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Stack(children: [
        ListTile(
          leading: Icon(
            costList.posMin == true
                ? Icons.add_circle_outline_rounded
                : Icons.remove_circle_outline,
            color: costList.posMin == true ? kGreenLightColor : kRedLightColor,
          ),
          title: Text(
            costList.title,
          ),
          trailing:
              Text(costList.currencyCode + " " + costList.money.toString()),
        ),
      ]),
    );
  }
}
