import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'myCostLists.dart';
import '../../../services/search.dart';
import 'remaning.dart';

class Body extends StatelessWidget {
  final VoidCallback onSignedOut;
  const Body({Key key, this.onSignedOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(KdefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Stat",
                    style: TextStyle(
                        fontSize: kHeadlineSize, fontWeight: FontWeight.bold)),
                MySwitch(),
              ],
            ),
            Column(
              children: [
                RemaningBudget(),
                MyCostLists(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
