import 'package:flutter/material.dart';
import 'package:money_lab/src/layouts/detail_page/details.dart';
import 'package:money_lab/src/models/costLists.new.dart';
import 'package:money_lab/src/services/service_costLists.dart';

import 'costList.dart';

class MyCostLists extends StatefulWidget {
  const MyCostLists({
    Key key,
  }) : super(key: key);

  @override
  _MyCostListsState createState() => _MyCostListsState();
}

class _MyCostListsState extends State<MyCostLists> {
  Future<List<CostLists>> allcosts;
  @override
  initState() {
    super.initState();
    _allCostsFunction();
  }

  _allCostsFunction() async {
    setState(() {
      allcosts = ServiceCostList.getAllCosts();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: allcosts,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container(
              height: MediaQuery.of(context).size.height / 1.8,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container(
              height: MediaQuery.of(context).size.height / 1.8,
              child: ListView.separated(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: snapshot.data.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemBuilder: (context, int index) => CostList(
                  costList: snapshot.data[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        costList: snapshot.data[index],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
