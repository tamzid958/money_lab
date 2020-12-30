import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/layouts/add_new_cost/add_new_cost.dart';
import 'package:money_lab/src/layouts/budget/budget.dart';
import 'package:money_lab/src/layouts/profile/profile.dart';
import 'package:money_lab/src/layouts/reportPage/report.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onSignedOut;
  const HomeScreen({Key key, this.onSignedOut}) : super(key: key);

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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      Body(
        onSignedOut: widget.onSignedOut,
      ),
      ReportPage(
        onSignedOut: widget.onSignedOut,
      ),
      BudgetPage(
        onSignedOut: widget.onSignedOut,
      ),
      ProfileScreen(
        onSignedOut: widget.onSignedOut,
      ),
    ];
    void _newCostAdd() {
      showMaterialModalBottomSheet(
        context: context,
        builder: (context) => AddNewCost(),
      );
    }

    return Scaffold(
      body: _children[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 40,
          color: kPrimaryColor,
        ),
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
