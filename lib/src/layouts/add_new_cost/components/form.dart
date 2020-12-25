// This is the stateful widget that the main application instantiates.
import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

import 'datepicker.dart';

class FormScreen extends StatefulWidget {
  FormScreen({Key key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _FormScreenState extends State<FormScreen> {
  String _myActivity;
  bool visibilityIncome = true;
  TextEditingController amount = TextEditingController();
  TextEditingController tax = TextEditingController();
  TextEditingController mercent = TextEditingController();
  TextEditingController purpose = TextEditingController();
  TextEditingController notes = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
  }

  @override
  void dispose() {
    super.dispose();
  }

  _saveForm() {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(KdefaultPaddin / 2),
      reverse: true,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 500,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  DropDownFormField(
                    titleText: 'Create Expenditure',
                    hintText: 'Please choose one',
                    value: _myActivity,
                    onSaved: (value) {
                      setState(() {
                        _myActivity = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _myActivity = value;
                        if (value == "Income") {
                          visibilityIncome = true;
                        } else {
                          visibilityIncome = false;
                        }
                      });
                    },
                    dataSource: [
                      {
                        "display": "Income",
                        "value": "Income",
                      },
                      {
                        "display": "Expense",
                        "value": "Expense",
                      },
                    ],
                    textField: 'display',
                    valueField: 'value',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: amount,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Total Amount',
                        labelText: 'Total Amount',
                        prefix: Icon(
                          Icons.monetization_on,
                        )),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter valid amount';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  !visibilityIncome
                      ? TextFormField(
                          controller: tax,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Tax Amount (%)',
                            hintText: 'Tax Amount (%)',
                            prefix: Icon(
                              Icons.gavel,
                            ),
                          ),
                        )
                      : Container(),
                  !visibilityIncome
                      ? SizedBox(
                          height: 10,
                        )
                      : Container(),
                  !visibilityIncome
                      ? TextFormField(
                          controller: mercent,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Merchant',
                            hintText: 'Merchant',
                            prefix: Icon(
                              Icons.store,
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter valid text';
                            }
                            return null;
                          },
                        )
                      : Container(),
                  visibilityIncome
                      ? TextFormField(
                          controller: mercent,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Source',
                            hintText: 'Source',
                            prefix: Icon(
                              Icons.source,
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter valid text';
                            }
                            return null;
                          },
                        )
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextFieldDatePicker(
                    labelText: "Date",
                    prefixIcon: Icon(Icons.date_range),
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    lastDate: DateTime.now().add(Duration(days: 366)),
                    firstDate: DateTime.now(),
                    initialDate: DateTime.now().add(Duration(days: 1)),
                    onDateChanged: (selectedDate) {
                      // Do something with the selected date
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  !visibilityIncome
                      ? TextFormField(
                          controller: purpose,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Purpose',
                            hintText: 'Purpose',
                            prefix: Icon(
                              Icons.bookmark,
                            ),
                          ),
                        )
                      : Container(),
                  visibilityIncome
                      ? TextFormField(
                          controller: mercent,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Description',
                            hintText: 'Description',
                            prefix: Icon(
                              Icons.description,
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter valid text';
                            }
                            return null;
                          },
                        )
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: notes,
                    maxLines: 6,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Notes',
                      hintText: 'Notes',
                      prefix: Icon(
                        Icons.notes,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    // Process data.
                    _saveForm();
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: kOptionalColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
