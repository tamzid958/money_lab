import 'package:flutter/material.dart';
import 'components/body.dart';

class EditBudget extends StatelessWidget {
  const EditBudget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
