// This is the stateful widget that the main application instantiates.
import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:money_lab/src/layouts/home/home.dart';
import 'package:money_lab/src/models/costLists.new.dart';
import 'package:money_lab/src/services/datepicker.dart';
import 'package:money_lab/src/services/datformatter.dart';
import 'package:money_lab/src/services/service_costLists.dart';

class FormScreen extends StatefulWidget {
  FormScreen({Key key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _FormScreenState extends State<FormScreen> {
  TextEditingController _amountController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  String _myActivity;
  bool visibilityIncome = true;
  var costDate = DateTime.now();
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

  _saveForm() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      final costlist = CostLists(
          null,
          _titleController.text,
          DateFormater.convertDateTimeDisplay(costDate.toString()),
          double.parse(_amountController.text),
          visibilityIncome,
          _noteController.text);
      await ServiceCostList.addCost(costlist);
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
              height: MediaQuery.of(context).size.height / 1.5,
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
                    controller: _amountController,
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
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: !visibilityIncome ? 'Merchant' : 'Source',
                      hintText: !visibilityIncome ? 'Merchant' : 'Source',
                      prefix: Icon(
                        !visibilityIncome ? Icons.store : Icons.source,
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
                    height: 10,
                  ),
                  MyTextFieldDatePicker(
                    labelText: "Date",
                    prefixIcon: Icon(Icons.date_range),
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    lastDate: DateTime.now().add(Duration(days: 366)),
                    firstDate: DateTime.now(),
                    initialDate: DateTime.now(),
                    onDateChanged: (selectedDate) {
                      setState(() {
                        costDate = selectedDate;
                      });
                      // Do something with the selected date
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _noteController,
                    maxLines: 6,
                    maxLength: 160,
                    maxLengthEnforced: true,
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
                onPressed: () async {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    // Process data.

                    _saveForm();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false);
                    //Navigator.pop(context);
                    // Navigator.pop(context);
                  }
                },
                child: Text(
                  'Submit',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
