import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money_lab/src/auth/auth.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/layouts/home/home.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginBodyScreen extends StatelessWidget {
  final AuthService auth;
  final VoidCallback onSignedIn;
  LoginBodyScreen({Key key, this.auth, this.onSignedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(KdefaultPaddin * 3),
      color: kPrimaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lotties/login.json'),
            Text("Money Lab",
                style: TextStyle(
                    color: kOptionalColor, fontSize: kHeadlineSize * 1.3)),
            SignInButton(
              Buttons.Google,
              onPressed: () async {
                await authService.googleSignIn();
                Route route =
                    MaterialPageRoute(builder: (context) => HomeScreen());
                Navigator.pushReplacement(context, route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
