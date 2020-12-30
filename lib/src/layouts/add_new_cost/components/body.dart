import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'form.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(KdefaultPaddin / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(KdefaultPaddin / 2),
                  child: Text(
                    "   Conservation",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FormScreen(),
          ],
        ),
      ),
    );
  }
}
