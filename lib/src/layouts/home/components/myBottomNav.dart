import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
