// This is the stateful widget that the main application instantiates.
import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class AddNewCost extends StatefulWidget {
  AddNewCost({Key key}) : super(key: key);

  @override
  _AddNewCostState createState() => _AddNewCostState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AddNewCostState extends State<AddNewCost> {
  String _myActivity;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
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
    return Container(
      padding: EdgeInsets.all(KdefaultPaddin),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DropDownFormField(
              titleText: 'Type',
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
                });
              },
              dataSource: [
                {
                  "display": "Adding",
                  "value": "Adding",
                },
                {
                  "display": "Subtracting",
                  "value": "Subtracting",
                },
              ],
              textField: 'display',
              valueField: 'value',
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Source / Destination',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Source / Destination',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
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
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: kTextColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
