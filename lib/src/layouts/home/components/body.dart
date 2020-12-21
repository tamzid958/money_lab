import 'package:flutter/material.dart';
import 'package:money_lab/auth.dart';
import 'package:money_lab/constants.dart';
import 'myCostLists.dart';
import 'myswitch.dart';

class Body extends StatelessWidget {
  final AuthService auth;
  final VoidCallback onSignedOut;
  const Body({Key key, this.auth, this.onSignedOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(KdefaultPaddin),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Stat",
                        style: TextStyle(
                            fontSize: kHeadlineSize,
                            fontWeight: FontWeight.bold)),
                    MySwitch(auth: auth, onSignedOut: onSignedOut),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                MyCostLists(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
