import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/models/costLists.new.dart';
import 'form.dart';

class Body extends StatefulWidget {
  final CostLists costList;
  Body({Key key, this.costList}) : super(key: key);

  @override
  _BodyState createState() => _BodyState(costList: costList);
}

class _BodyState extends State<Body> {
  CostLists costList;
  _BodyState({this.costList});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(KdefaultPaddin / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(KdefaultPaddin / 2),
                  child: Text(
                    "   Conservation",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FormScreen(costList: costList),
          ],
        ),
      ),
    );
  }
}
