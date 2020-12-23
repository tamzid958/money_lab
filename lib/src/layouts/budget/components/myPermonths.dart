import 'package:flutter/material.dart';
import 'package:money_lab/src/models/budgetLists.dart';

import 'permonth.dart';

class MyCostLists extends StatelessWidget {
  const MyCostLists({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 480,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: budgetLists.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (context, int index) => PerMonthBudgetCard(
            budgetList: budgetLists[index],
          ),
        ),
      ),
    );
  }
}