import 'package:flutter/material.dart';
import 'package:money_lab/auth.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/layouts/add_new_cost/add_new_cost.dart';
import 'package:money_lab/src/layouts/budget/budget.dart';
import 'package:money_lab/src/layouts/profile/profile.dart';
import 'package:money_lab/src/layouts/reportPage/report.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  final AuthService auth;
  final VoidCallback onSignedOut;
  const HomeScreen({Key key, this.auth, this.onSignedOut}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      Body(
        auth: widget.auth,
        onSignedOut: widget.onSignedOut,
      ),
      ReportPage(
        auth: widget.auth,
        onSignedOut: widget.onSignedOut,
      ),
      BudgetPage(
        auth: widget.auth,
        onSignedOut: widget.onSignedOut,
      ),
      ProfileScreen(
        auth: widget.auth,
        onSignedOut: widget.onSignedOut,
      ),
    ];
    void _newCostAdd() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddNewCost(),
        ),
      );
    }

    return Scaffold(
      body: _children[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _newCostAdd,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(KdefaultPaddin),
              topLeft: Radius.circular(KdefaultPaddin)),
          boxShadow: [
            BoxShadow(color: kLightBlueColor, spreadRadius: 0, blurRadius: 0),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(KdefaultPaddin),
            topRight: Radius.circular(KdefaultPaddin),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Daily',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics),
                label: 'Report',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance),
                label: 'Budget',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            unselectedItemColor: kAshColor,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
