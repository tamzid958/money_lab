import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/models/totalList.dart';

class Body extends StatefulWidget {
  final TotalLists totalLists;
  const Body({Key key, this.totalLists}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double _currentSliderValue = 20;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    var now = DateTime.now();
    var currentMon = now.month;
    var currentBudget;
    for (var i = 0; i < totalLists.length; i++) {
      if (totalLists[i].month == months[currentMon - 1] &&
          totalLists[i].checked != true) {
        currentBudget = totalLists[i];
      }
    }

    return SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(KdefaultPaddin),
          child: Column(
            children: [
              currentBudget != null
                  ? Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: KdefaultPaddin * 3,
                            ),
                            Text(
                              currentBudget.month,
                              style: TextStyle(fontSize: kHeadlineSize),
                            ),
                            SizedBox(
                              height: KmodiPaddin,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Title',
                                hintText: 'Title',
                                prefix: Icon(
                                  Icons.title,
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter valid text';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: KmodiPaddin,
                            ),
                            Text("Target Budget: "),
                            Slider(
                              value: _currentSliderValue,
                              min: 0,
                              activeColor: kAccentColor,
                              inactiveColor: kPrimaryColor,
                              max: currentBudget.total,
                              divisions: 100,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: FlatButton(
                                onPressed: () {
                                  // Validate returns true if the form is valid, or false
                                  // otherwise.
                                  if (_formKey.currentState.validate()) {
                                    // If the form is valid, display a Snackbar.
                                    Navigator.pop(context);
                                  }
                                },
                                color: Theme.of(context).accentColor,
                                child: Text('Submit',
                                    style: TextStyle(color: kBlackColor)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: KdefaultPaddin * 3,
                        ),
                        Center(
                          child: Text("Budget Already Set for " +
                              months[currentMon - 1] +
                              " month"),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
