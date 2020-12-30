import 'package:flutter/material.dart';
import 'package:money_lab/src/layouts/detail_page/details.dart';
import 'package:money_lab/src/models/costLists.dart';

import 'costList.dart';

class MyCostLists extends StatelessWidget {
  const MyCostLists({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        child: ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: costLists.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (context, int index) => CostList(
            costList: costLists[index],
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  costList: costLists[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
