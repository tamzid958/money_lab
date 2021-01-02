import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/models/budgetLists.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PerMonthBudgetCard extends StatelessWidget {
  final BudgetLists budgetList;

  const PerMonthBudgetCard({
    Key key,
    this.budgetList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(KdefaultPaddin / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: kAccentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Container(
                width: 100,
                height: 100,
                child: Center(
                  child: Text(
                    budgetList.month,
                    style: TextStyle(
                        color: kOptionalColor, fontSize: kHeadlineSize),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "  " + budgetList.title,
                    style: TextStyle(
                      color: kOptionalColor,
                      fontSize: kTextSize,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "  \$ " + budgetList.income.toString(),
                        style: TextStyle(
                          color: kOptionalColor,
                          fontSize: kTitleSize,
                        ),
                      ),
                      SizedBox(
                        width: KmodiPaddin,
                      ),
                      Text(
                        ((budgetList.income - budgetList.income) / 100)
                                .toString() +
                            " %",
                        style: TextStyle(
                          color: kRedColor,
                          fontSize: kTextSize / 1.2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: KmodiPaddin,
                  ),
                  LinearPercentIndicator(
                    percent: ((budgetList.income - budgetList.income) / 10000),
                    lineHeight: 5,
                    progressColor: kRedColor,
                    animation: true,
                    animationDuration: 1000,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: KmodiPaddin,
            ),
            Column(
              children: [
                Container(
                  color: kRedColor,
                  width: 40,
                  child: Center(
                    child: Text("Warning",
                        style: TextStyle(
                            color: kOptionalColor, fontSize: kTextSize / 1.4)),
                  ),
                ),
                SizedBox(
                  height: KmodiPaddin,
                ),
                Text(
                  "\$ " + (budgetList.income - budgetList.income).toString(),
                  style: TextStyle(
                      color: kOptionalColor, fontSize: kTextSize / 1.4),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
