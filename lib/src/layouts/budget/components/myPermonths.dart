import 'package:flutter/material.dart';
import 'package:money_lab/src/models/budgetLists.dart';
import 'permonth.dart';

class MyCostLists extends StatefulWidget {
  final BudgetLists budgetLists;
  const MyCostLists({
    Key key,
    this.budgetLists,
  }) : super(key: key);

  @override
  _MyCostListsState createState() => _MyCostListsState();
}

class _MyCostListsState extends State<MyCostLists> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.4,
        child: ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
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
