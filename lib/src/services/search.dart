import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';

class MySwitch extends StatefulWidget {
  const MySwitch({
    Key key,
  }) : super(key: key);

  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            icon: Icon(Icons.search_rounded),
            color: kOptionalColor,
            onPressed: () => null),
      ],
    );
  }
}
