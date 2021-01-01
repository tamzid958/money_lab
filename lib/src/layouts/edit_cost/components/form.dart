// This is the stateful widget that the main application instantiates.
import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/layouts/home/home.dart';
import 'package:money_lab/src/models/costLists.new.dart';
import 'package:intl/intl.dart';
import 'package:money_lab/src/services/service_costLists.dart';

class FormScreen extends StatefulWidget {
  final CostLists costList;
  FormScreen({Key key, this.costList}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState(costList: costList);
}

/// This is the private State class that goes with MyStatefulWidget.
class _FormScreenState extends State<FormScreen> {
  TextEditingController _amountController;
  TextEditingController _titleController;
  TextEditingController _noteController;
  CostLists costList;
  final dateFormat = DateFormat('dd-MM-yyyy');
  _FormScreenState({this.costList});
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: costList.money.toString());
    _titleController = TextEditingController(text: costList.title);
    _noteController = TextEditingController(text: costList.notes ?? "");
  }

  @override
  void dispose() {
    super.dispose();
  }

  _saveForm() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      final ucostList = CostLists(
          costList.id,
          _titleController.text,
          costList.time,
          double.parse(_amountController.text),
          costList.posMin,
          _noteController.text);
      await ServiceCostList.updateCost(ucostList);
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
              height: MediaQuery.of(context).size.height / 1.8,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
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
                      labelText: !costList.posMin ? 'Merchant' : 'Source',
                      hintText: !costList.posMin ? 'Merchant' : 'Source',
                      prefix: Icon(
                        !costList.posMin ? Icons.store : Icons.source,
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
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    // Process data.
                    _saveForm();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false);
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
