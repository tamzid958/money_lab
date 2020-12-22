import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onSignedOut;
  const ProfileScreen({Key key, this.onSignedOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Body(onSignedOut: onSignedOut),
    );
  }
}
