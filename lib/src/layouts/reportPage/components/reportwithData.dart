import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:money_lab/constants.dart';

class ReportWithData extends StatelessWidget {
  const ReportWithData({
    Key key,
    @required this.allSum,
    @required this.lastEleven,
  }) : super(key: key);

  final Future<List<Map<String, dynamic>>> allSum;
  final Future<List<double>> lastEleven;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([allSum, lastEleven]),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Text("Not Enough Data");
        } else {
          try {
            return Column(
              children: [
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
                            "\$ " + snapshot.data[0][0]["money"].toString() ??
                                "0.0",
                            style: TextStyle(
                                color: kRedLightColor, fontSize: kHeadlineSize),
                          ),
                          Padding(
                            padding: EdgeInsets.all(KdefaultPaddin),
                            child: snapshot.data[1].length >= 5
                                ? Sparkline(
                                    data: snapshot.data[1],
                                    lineColor: kOptionalColor,
                                    pointColor: kAccentColor,
                                    pointsMode: PointsMode.all,
                                    pointSize: KmodiPaddin,
                                  )
                                : Center(
                                    child: Text("Not Enough Data"),
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
                                "\$ " +
                                        snapshot.data[0][1]["money"]
                                            .toString() ??
                                    "0.0",
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
                                "\$ " +
                                        snapshot.data[0][0]["money"]
                                            .toString() ??
                                    "0.0",
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
                ),
              ],
            );
          } catch (e) {
            return Text("Not Enough Data");
          }
        }
      },
    );
  }
}
