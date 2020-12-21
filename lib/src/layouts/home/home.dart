import 'package:flutter/material.dart';
import 'package:money_lab/auth.dart';
import 'package:money_lab/src/layouts/add_new_cost/add_new_cost.dart';
import 'components/body.dart';
import 'components/myBottomNav.dart';

class HomeScreen extends StatelessWidget {
  final AuthService auth;
  final VoidCallback onSignedOut;
  const HomeScreen({Key key, this.auth, this.onSignedOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _newCostAdd() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddNewCost(),
        ),
      );
    }

    return Scaffold(
      body: Body(
        auth: auth,
        onSignedOut: onSignedOut,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _newCostAdd,
      ),
      bottomNavigationBar: MyBottomNavigation(),
    );
  }
}
