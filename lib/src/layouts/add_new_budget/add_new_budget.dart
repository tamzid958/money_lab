import 'package:flutter/material.dart';
import 'components/body.dart';

class AddNewBudget extends StatelessWidget {
  const AddNewBudget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
