import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/layouts/edit_cost/edit_cost.dart';
import 'package:money_lab/src/layouts/home/home.dart';
import 'package:money_lab/src/models/costLists.new.dart';
import 'package:money_lab/src/services/service_costLists.dart';

class TransSceen extends StatefulWidget {
  final CostLists costList;
  const TransSceen({Key key, this.costList}) : super(key: key);

  @override
  _TransSceenState createState() => _TransSceenState(costList: costList);
}

bool _readMore = false;

class _TransSceenState extends State<TransSceen> {
  CostLists costList;

  _TransSceenState({this.costList});

  Future<void> deleteCost(BuildContext context) async {
    await ServiceCostList.deleteCost(costList.id);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    _readMore = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  readMore() {
    setState(() {
      _readMore ^= true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(KdefaultPaddin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: Card(
                color: kOptionalColor,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(KmodiPaddin),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(KdefaultPaddin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Payee",
                        style:
                            TextStyle(color: kBlackColor, fontSize: kTextSize),
                      ),
                      Text(
                        costList.title,
                        style:
                            TextStyle(color: kBlackColor, fontSize: kTitleSize),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Transaction type",
                                style: TextStyle(
                                    color: kBlackColor, fontSize: kTextSize),
                              ),
                              Text(
                                costList.posMin ? "Income" : "Expense",
                                style: TextStyle(
                                    color: kBlackColor, fontSize: kTitleSize),
                              ),
                            ],
                          ),
                          Container(
                            height: 30.0,
                            width: 1.0,
                            color: kPrimaryColor,
                            margin: EdgeInsets.only(
                                left: KmodiPaddin, right: KmodiPaddin),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(
                                    color: kBlackColor, fontSize: kTextSize),
                              ),
                              Text(
                                costList.time,
                                style: TextStyle(
                                    color: kBlackColor, fontSize: kTitleSize),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              child: Card(
                color: kOptionalColor,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(KmodiPaddin),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(KdefaultPaddin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amount",
                            style: TextStyle(
                                color: kBlackColor, fontSize: kTextSize),
                          ),
                          Text(
                            "\$" + " " + costList.money.toString(),
                            style: TextStyle(
                                color: kBlackColor, fontSize: kHeadlineSize),
                          ),
                        ],
                      ),
                      OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(KmodiPaddin * 3)),
                        borderSide: BorderSide(color: kBlackColor),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditCost(costList: costList)),
                        ),
                        child: Text(
                          'Edit',
                          style: TextStyle(color: kBlackColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            costList.notes.length != 0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: kPrimaryColor,
                        child: IconButton(
                          icon: Icon(
                            !_readMore
                                ? Icons.arrow_downward_outlined
                                : Icons.arrow_upward_outlined,
                            color: kAccentColor,
                          ),
                          onPressed: readMore,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AnimatedOpacity(
                        opacity: _readMore ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 300),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            (costList.notes ?? "no note available"),
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: kTextSize),
                          ),
                        ),
                      ),
                    ],
                  )
                : Align(
                    alignment: Alignment.center,
                    child: Text("no note available"),
                  ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton.icon(
                color: kRedColor,
                onPressed: () => deleteCost(context),
                icon: Icon(Icons.delete),
                label: Text("Delete"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
