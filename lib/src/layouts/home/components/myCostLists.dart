import 'package:flutter/material.dart';
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
        height: 500,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: costLists.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (context, int index) => CostList(
            costList: costLists[index],
          ),
        ),
      ),
    );
  }
}
