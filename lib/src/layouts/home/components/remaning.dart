import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/services/service_costLists.dart';

class RemaningBudget extends StatefulWidget {
  const RemaningBudget({
    Key key,
  }) : super(key: key);

  @override
  _RemaningBudgetState createState() => _RemaningBudgetState();
}

class _RemaningBudgetState extends State<RemaningBudget> {
  Future<List<Map<String, dynamic>>> allSum;

  @override
  initState() {
    super.initState();
    _allCostsFunction();
  }

  _allCostsFunction() {
    setState(() {
      allSum = ServiceCostList.getAllSumCost();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: allSum,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Card(
            color: kPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.all(KdefaultPaddin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/money-bag.png",
                    width: 80,
                    height: 80,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Budget",
                        style: TextStyle(
                          color: kOptionalColor,
                          fontSize: kTextSize,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "not enough data",
                            style: TextStyle(fontSize: kTextSize),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          try {
            return Card(
              color: kPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.all(KdefaultPaddin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/money-bag.png",
                      width: 80,
                      height: 80,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remaining Budget",
                          style: TextStyle(
                            color: kOptionalColor,
                            fontSize: kTextSize,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$ " + snapshot.data[1]["money"].toString(),
                              style: TextStyle(
                                color: kGreenLightColor,
                                fontSize: kTitleSize,
                              ),
                            ),
                            Text(
                              " / ",
                              style: TextStyle(
                                color: kOptionalColor,
                                fontSize: kTitleSize,
                              ),
                            ),
                            Text(
                              "\$ " + snapshot.data[0]["money"].toString(),
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: kTitleSize,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          } catch (e) {
            return Card(
              color: kPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.all(KdefaultPaddin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/money-bag.png",
                      width: 80,
                      height: 80,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remaining Budget",
                          style: TextStyle(
                            color: kOptionalColor,
                            fontSize: kTextSize,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "not enough data",
                              style: TextStyle(fontSize: kTextSize),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        }
      },
    );
  }
}
