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
      if (totalLists[i].month == months[currentMon - 1]) {
        currentBudget = totalLists[i];
      }
    }

    return Padding(
      padding: const EdgeInsets.all(KdefaultPaddin),
      child: Column(
        children: [
          Container(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: KmodiPaddin,
                  ),
                  Text("Target Budget"),
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
                      child:
                          Text('Submit', style: TextStyle(color: kBlackColor)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
