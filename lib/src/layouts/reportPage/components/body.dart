import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/services/themeChanger.dart';

class Body extends StatelessWidget {
  const Body({Key key, onSignedOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
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
              Card(
                color: Theme.of(context).primaryColor,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(KdefaultPaddin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Money Spent",
                          style: TextStyle(color: kOptionalColor),
                        ),
                        Text(
                          "\$ 32432",
                          style: TextStyle(
                              color: kRedLightColor, fontSize: kHeadlineSize),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(KdefaultPaddin),
                          child: Sparkline(
                            data: data,
                            lineColor: kOptionalColor,
                            pointColor: kAccentColor,
                            pointsMode: PointsMode.all,
                            pointSize: KmodiPaddin,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(KdefaultPaddin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.monetization_on,
                              color: kGreenLightColor,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Income",
                              style: TextStyle(
                                color: kOptionalColor,
                                fontSize: kTextSize,
                              ),
                            ),
                            Text(
                              "\$ 32432",
                              style: TextStyle(
                                color: kOptionalColor,
                                fontSize: kTitleSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(KdefaultPaddin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.fireplace_rounded,
                              color: kRedLightColor,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Expense",
                              style: TextStyle(
                                  color: kOptionalColor, fontSize: kTextSize),
                            ),
                            Text(
                              "\$ 32432",
                              style: TextStyle(
                                color: kOptionalColor,
                                fontSize: kTitleSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
