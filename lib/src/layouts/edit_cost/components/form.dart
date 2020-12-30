// This is the stateful widget that the main application instantiates.
import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/models/costLists.dart';
import 'package:intl/intl.dart';

class FormScreen extends StatefulWidget {
  final CostLists costList;
  FormScreen({Key key, this.costList}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState(costList: costList);
}

/// This is the private State class that goes with MyStatefulWidget.
class _FormScreenState extends State<FormScreen> {
  CostLists costList;
  final dateFormat = DateFormat('dd-MM-yyyy');
  _FormScreenState({this.costList});

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
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
                  TextFormField(
                    initialValue: costList.money.toString(),
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
                  !costList.posMin
                      ? TextFormField(
                          initialValue: costList.title,
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
                  costList.posMin
                      ? TextFormField(
                          initialValue: costList.title,
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
                  SizedBox(
                    height: 10,
                  ),
                  !costList.posMin
                      ? TextFormField(
                          initialValue: costList.description ?? "",
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
                  costList.posMin
                      ? TextFormField(
                          initialValue: costList.description ?? "",
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
                    initialValue: costList.notes ?? "",
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
                  style: TextStyle(color: kBlackColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
