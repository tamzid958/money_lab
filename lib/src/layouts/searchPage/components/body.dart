import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/layouts/detail_page/details.dart';
import 'package:money_lab/src/layouts/home/components/costList.dart';
import 'package:money_lab/src/models/costLists.new.dart';
import 'package:money_lab/src/services/service_costLists.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _searchController = TextEditingController();
  Future<List<CostLists>> allcosts;
  @override
  initState() {
    super.initState();
    _allCostsFunction();
  }

  _allCostsFunction() async {
    setState(() {
      allcosts = ServiceCostList.getSearchCosts(_searchController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _filterCost(value) {
    setState(() {
      allcosts = ServiceCostList.getSearchCosts(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(KdefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Search Cost", style: TextStyle(fontSize: kHeadlineSize)),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search Cost',
                labelText: 'Search Cost',
                prefix: Icon(
                  Icons.search,
                ),
              ),
              onChanged: (value) => _filterCost(value),
            ),
            FutureBuilder(
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
                  return Padding(
                    padding: const EdgeInsets.all(KdefaultPaddin),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.5,
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
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
