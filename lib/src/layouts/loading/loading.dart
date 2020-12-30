import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money_lab/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(KdefaultPaddin * 3),
      color: kPrimeDark,
      child: Center(
        child: Lottie.asset('assets/lotties/login.json'),
      ),
    );
  }
}
