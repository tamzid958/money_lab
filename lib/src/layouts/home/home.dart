import 'package:flutter/material.dart';
import 'package:money_lab/src/layouts/add_new_cost/add_new_cost.dart';
import 'components/body.dart';
import 'components/myBottomNav.dart';

class HomeScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _newCostAdd() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewCost(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _newCostAdd,
      ),
      bottomNavigationBar: MyBottomNavigation(),
    );
  }
}
