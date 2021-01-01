import 'package:flutter/material.dart';
import 'package:money_lab/src/models/costLists.new.dart';
//import 'package:money_lab/src/models/costLists.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final CostLists costList;
  const DetailsScreen({Key key, this.costList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(costList: costList),
    );
  }
}
