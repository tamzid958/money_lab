import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'myCostLists.dart';
import 'myswitch.dart';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Stat",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  MySwitch(),
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
    );
  }
}
