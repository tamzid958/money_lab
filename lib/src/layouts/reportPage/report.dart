import 'package:flutter/material.dart';
import 'package:money_lab/auth.dart';

class ReportPage extends StatelessWidget {
  final AuthService auth;
  final VoidCallback onSignedOut;
  const ReportPage({Key key, this.auth, this.onSignedOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Report"),
    );
  }
}
