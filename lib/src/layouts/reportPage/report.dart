import 'package:flutter/material.dart';

import 'components/body.dart';

class ReportPage extends StatelessWidget {
  final VoidCallback onSignedOut;
  const ReportPage({Key key, this.onSignedOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Body(onSignedOut: onSignedOut),
    );
  }
}
