import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:money_lab/auth.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/layouts/login/login.dart';

class MySwitch extends StatefulWidget {
  final AuthService auth;
  final VoidCallback onSignedOut;
  const MySwitch({
    Key key,
    this.auth,
    this.onSignedOut,
  }) : super(key: key);

  @override
  _MySwitchState createState() => _MySwitchState(auth, onSignedOut);
}

class _MySwitchState extends State<MySwitch> {
  AuthService auth;
  VoidCallback onSignedOut;
  _MySwitchState(this.auth, this.onSignedOut);
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: _isSwitched,
          activeColor: kAshColor,
          activeTrackColor: kWhiteColor,
          onChanged: (value) {
            setState(
              () {
                if (_isSwitched == false) {
                  AdaptiveTheme.of(context).setDark();
                } else {
                  AdaptiveTheme.of(context).setLight();
                }
                _isSwitched = value;
              },
            );
          },
        ),
        IconButton(icon: Icon(Icons.search_rounded), onPressed: () => null),
        SignOutButton(
          auth: auth,
          onSignedOut: onSignedOut,
        )
      ],
    );
  }
}

class SignOutButton extends StatelessWidget {
  SignOutButton({this.auth, this.onSignedOut});
  final AuthService auth;
  final VoidCallback onSignedOut;

  @override
  Widget build(BuildContext context) {
    void _signOut() async {
      try {
        await auth.signOut();
        onSignedOut();
        Route route = MaterialPageRoute(builder: (context) => LoginScreen());
        Navigator.pushReplacement(context, route);
      } catch (e) {
        print(e);
      }
    }

    return IconButton(icon: Icon(Icons.logout), onPressed: () => _signOut());
  }
}
