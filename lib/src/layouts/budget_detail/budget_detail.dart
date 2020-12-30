import 'package:flutter/material.dart';
import 'package:money_lab/src/models/budgetLists.dart';
import 'components/body.dart';

class BudgetDetail extends StatelessWidget {
  final VoidCallback onSignedOut;
  final BudgetLists budgetList;
  const BudgetDetail({Key key, this.onSignedOut, this.budgetList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Body(onSignedOut: onSignedOut, budgetList: budgetList),
      ),
    );
  }
}
