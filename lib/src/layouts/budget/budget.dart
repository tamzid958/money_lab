import 'package:flutter/material.dart';
import 'package:money_lab/src/auth/auth.dart';
import 'components/body.dart';

class BudgetPage extends StatelessWidget {
  final AuthService auth;
  final VoidCallback onSignedOut;
  const BudgetPage({Key key, this.auth, this.onSignedOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Body(),
    );
  }
}
