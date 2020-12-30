import 'package:flutter/material.dart';
import 'package:money_lab/src/models/budgetLists.dart';
import 'components/body.dart';

class EditBudget extends StatelessWidget {
  final BudgetLists budgetList;
  const EditBudget({Key key, this.budgetList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(budgetList: budgetList),
    );
  }
}
