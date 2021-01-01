import 'package:flutter/material.dart';

import 'package:money_lab/constants.dart';
import 'package:money_lab/src/models/budgetLists.dart';

import 'package:money_lab/src/services/search.dart';
import 'package:money_lab/src/services/service_costLists.dart';

import 'reportwithData.dart';

class Body extends StatefulWidget {
  final BudgetLists budgetLists;
  const Body({Key key, onSignedOut, this.budgetLists}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<Map<String, dynamic>>> allSum;
  Future<List<double>> lastEleven;
  @override
  initState() {
    super.initState();
    _allCostsFunction();
  }

  _allCostsFunction() {
    setState(() {
      allSum = ServiceCostList.getAllSumCost();
      lastEleven = ServiceCostList.getLastElevenCost();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(KdefaultPaddin),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Report",
                    style: TextStyle(
                        fontSize: kHeadlineSize, fontWeight: FontWeight.bold),
                  ),
                  MySwitch(),
                ],
              ),
              ReportWithData(allSum: allSum, lastEleven: lastEleven),
            ],
          ),
        ),
      ),
    );
  }
}
