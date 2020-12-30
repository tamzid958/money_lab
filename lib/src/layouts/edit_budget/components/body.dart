import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/models/budgetLists.dart';

class Body extends StatefulWidget {
  final BudgetLists budgetList;
  const Body({Key key, this.budgetList}) : super(key: key);

  @override
  _BodyState createState() => _BodyState(budgetList: budgetList);
}

class _BodyState extends State<Body> {
  BudgetLists budgetList;
  _BodyState({this.budgetList});
  double _currentSliderValue = 20;

  @override
  void initState() {
    _currentSliderValue = budgetList.target;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(KdefaultPaddin),
            child: Row(
              children: [
                Text("Monthly Budget",
                    style: TextStyle(fontSize: kHeadlineSize)),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(KdefaultPaddin),
              child: Column(
                children: [
                  Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Edit Month: " + budgetList.month,
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
                            max: budgetList.income,
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
