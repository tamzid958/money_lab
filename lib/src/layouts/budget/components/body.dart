import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/layouts/add_new_budget/add_new_budget.dart';
import 'package:money_lab/src/services/themeChanger.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'myPermonths.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  void _addNewBudget(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => AddNewBudget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(KdefaultPaddin),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Budget",
                    style: TextStyle(
                        fontSize: kHeadlineSize, fontWeight: FontWeight.bold)),
                MySwitch(),
              ],
            ),
            SizedBox(
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
            MyCostLists(),
          ],
        ),
      ),
    );
  }
}
