import 'package:flutter/material.dart';
import 'package:money_lab/src/auth/auth.dart';
import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  final AuthService auth;
  final VoidCallback onSignedIn;
  const LoginScreen({Key key, this.auth, this.onSignedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBodyScreen(auth: auth, onSignedIn: onSignedIn),
    );
  }
}
