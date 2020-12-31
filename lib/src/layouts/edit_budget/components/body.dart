import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          SingleChildScrollView(
            child: Container(
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
                            SizedBox(
                              height: KmodiPaddin,
                            ),
                            TextFormField(
                              initialValue: budgetList.title,
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
                            TextFormField(
                              initialValue: budgetList.target.toString(),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Target',
                                hintText: 'Target',
                                prefix: Icon(
                                  Icons.center_focus_strong,
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter valid number';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: KmodiPaddin,
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
                                child: Text(
                                  'Submit',
                                ),
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
          ),
        ],
      ),
    );
  }
}
