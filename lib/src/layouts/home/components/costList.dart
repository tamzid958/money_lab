import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/models/costLists.new.dart';

class CostList extends StatefulWidget {
  final CostLists costList;
  final Function press;
  const CostList({Key key, this.costList, this.press}) : super(key: key);

  @override
  _CostListState createState() => _CostListState();
}

class _CostListState extends State<CostList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Stack(children: [
        ListTile(
          leading: Icon(
            widget.costList.posMin == true
                ? Icons.add_circle_outline_rounded
                : Icons.remove_circle_outline,
            color:
                widget.costList.posMin == true ? kGreenLightColor : kRedColor,
          ),
          title: Text(
            widget.costList.title,
          ),
          trailing: Text("\$" + " " + widget.costList.money.toString()),
        ),
      ]),
    );
  }
}
