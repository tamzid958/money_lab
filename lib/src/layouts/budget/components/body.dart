import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:http/http.dart' as http;
import 'package:money_lab/src/services/searcher.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _currencyConv = TextEditingController();
  List<String> currencies;
  String fromCurrency = "INR";
  String toCurrency = "USD";
  double result;
  var curr;
  @override
  void initState() {
    super.initState();
    curr = _loadCurrencies();
  }

  Future<String> _loadCurrencies() async {
    String uri = "http://api.openrates.io/latest";
    var response = await http.get(
      Uri.encodeFull(uri),
      headers: {'Accept': 'application/json'},
    );
    var responseBody = json.decode(response.body);
    Map curMap = responseBody["rates"];
    currencies = curMap.keys.toList();
    print(currencies);
    return "Success";
  }

  Future<String> _doConversion() async {
    String uri =
        "http://api.openrates.io/latest?base=$fromCurrency&symbols=$toCurrency";
    var response = await http.get(
      Uri.encodeFull(uri),
      headers: {'Accept': 'application/json'},
    );

    var responseBody = json.decode(response.body);

    setState(() {
      if (_currencyConv.text.isNotEmpty) {
        result = double.parse(_currencyConv.text.replaceAll(',', '')) *
            responseBody["rates"][toCurrency];
      } else {
        result = 0;
      }
    });

    return "Success";
  }

  _onFromCurrChanged(String value) {
    setState(() {
      fromCurrency = value;
    });
  }

  _onToCurrChanged(String value) {
    setState(() {
      toCurrency = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
          future: curr,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(KdefaultPaddin),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Currency Converter",
                          style: TextStyle(
                              fontSize: kHeadlineSize,
                              fontWeight: FontWeight.bold),
                        ),
                        Searcher(),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.all(KdefaultPaddin),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Currency Converter",
                        style: TextStyle(
                            fontSize: kHeadlineSize,
                            fontWeight: FontWeight.bold),
                      ),
                      Searcher(),
                    ],
                  ),
                  /* SizedBox(
                width: double.infinity,
                child: FlatButton.icon(
                  color: kPrimaryColor,
                  onPressed: () => _addNewBudget(context),
                  icon: Icon(Icons.new_releases, color: kOptionalColor),
                  label: Text(
                    "Add New Budget",
                    style: TextStyle(color: kOptionalColor),
                  ),
                ),
              ),
              MyCostLists(),*/
                  SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    title: TextField(
                      controller: _currencyConv,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Currency',
                        labelText: 'Currency',
                        prefix: Icon(
                          Icons.monetization_on,
                        ),
                      ),
                    ),
                    trailing: _buildDropDrowButton(fromCurrency),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    tileColor: kRedColor,
                    title: Text(
                        result != null
                            ? "\$ " + result.toStringAsFixed(3)
                            : "\$ 00.00",
                        style: TextStyle(fontSize: kTitleSize)),
                    trailing: _buildDropDrowButton(toCurrency),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton.icon(
                        color: kAccentColor,
                        label: Text("Convert"),
                        icon: Icon(Icons.settings_applications),
                        onPressed: () => _doConversion()),
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget _buildDropDrowButton(String currencyCategory) {
    return DropdownButton(
      value: currencyCategory,
      items: currencies
          .map(
            (String value) => DropdownMenuItem(
              value: value,
              child: Row(
                children: [
                  Text(value),
                ],
              ),
            ),
          )
          .toList(),
      onChanged: (value) => currencyCategory == fromCurrency
          ? _onFromCurrChanged(value)
          : _onToCurrChanged(value),
    );
  }
}
