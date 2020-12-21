import 'package:flutter/material.dart';
import 'package:money_lab/src/layouts/home/home.dart';
import 'package:money_lab/src/layouts/login/login.dart';
import 'auth.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final AuthService auth;

  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus { notSigned, signed }

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSigned;
  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        _authStatus = userId == null ? AuthStatus.notSigned : AuthStatus.signed;
      });
    }).catchError((Object error) {
      _authStatus = AuthStatus.notSigned;
    });
  }

  void _signedIn() {
    setState(() {
      _authStatus = AuthStatus.signed;
    });
  }

  void _signedOut() {
    setState(() {
      _authStatus = AuthStatus.notSigned;
    });
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notSigned:
        return LoginScreen(auth: widget.auth, onSignedIn: _signedIn);
        break;
      case AuthStatus.signed:
        return HomeScreen(auth: widget.auth, onSignedOut: _signedOut);
        break;
    }
  }
}
