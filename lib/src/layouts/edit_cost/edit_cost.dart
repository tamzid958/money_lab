import 'package:flutter/material.dart';
import 'package:money_lab/src/models/costLists.new.dart';
import 'components/body.dart';

class EditCost extends StatelessWidget {
  final CostLists costList;
  const EditCost({Key key, this.costList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(costList: costList),
    );
  }
}
