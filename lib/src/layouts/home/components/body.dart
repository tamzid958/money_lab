import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/services/searcher.dart';
import 'myCostLists.dart';
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
                Text(
                  "Stat",
                  style: TextStyle(
                      fontSize: kHeadlineSize, fontWeight: FontWeight.bold),
                ),
                Searcher()
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
