import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/layouts/detail_page/components/tranPage.dart';
import 'package:money_lab/src/models/costLists.new.dart';

class Body extends StatelessWidget {
  final CostLists costList;
  const Body({Key key, this.costList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(KdefaultPaddin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transaction",
                  style: TextStyle(fontSize: kHeadlineSize),
                ),
              ],
            ),
          ),
          TransSceen(costList: costList),
        ],
      ),
    );
  }
}
