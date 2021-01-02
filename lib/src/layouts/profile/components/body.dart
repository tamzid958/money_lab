import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/layouts/add_new_cost/add_new_cost.dart';
import 'package:money_lab/src/services/provider.dart';
import 'package:money_lab/src/services/searcher.dart';
import 'package:money_lab/src/services/service_costLists.dart';

class Body extends StatefulWidget {
  final VoidCallback onSignedOut;
  const Body({Key key, this.onSignedOut}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<double> remaining;

  @override
  initState() {
    super.initState();
    _allCostsFunction();
  }

  _allCostsFunction() {
    setState(() {
      remaining = ServiceCostList.getProfileRemain();
    });
  }

  void _signOut(BuildContext context, auth) async {
    try {
      await auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var auth = AuthProvider.of(context).auth;

    Future<List> profileData = auth.getProfile();

    return FutureBuilder<List>(
      future: Future.wait([profileData, remaining]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data[1]);
          return SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(KdefaultPaddin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Profile",
                          style: TextStyle(
                              fontSize: kHeadlineSize,
                              fontWeight: FontWeight.bold),
                        ),
                        Searcher(),
                      ],
                    ),
                    Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(KdefaultPaddin / 2),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  backgroundColor: kPrimaryColor,
                                  backgroundImage:
                                      snapshot.data[0][0].photoURL != null
                                          ? NetworkImage(
                                              snapshot.data[0][0].photoURL,
                                            )
                                          : AssetImage(
                                              "assets/images/user.png",
                                            ),
                                  maxRadius: 50.0,
                                  minRadius: 30.0,
                                ),
                                Text(
                                  snapshot.data[0][0].displayName,
                                  style: TextStyle(color: kOptionalColor),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 100,
                              child: Card(
                                color: Theme.of(context).accentColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(KmodiPaddin),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(KdefaultPaddin),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      snapshot.data[1] != null
                                          ? Text(
                                              "\$ " +
                                                  snapshot.data[1].toString(),
                                              style: TextStyle(
                                                  fontSize: kHeadlineSize),
                                            )
                                          : Text(
                                              "no data",
                                              style: TextStyle(
                                                  fontSize: kHeadlineSize),
                                            ),
                                      OutlineButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                KmodiPaddin * 3)),
                                        borderSide:
                                            BorderSide(color: kOptionalColor),
                                        onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddNewCost()),
                                        ),
                                        child: Text(
                                          'Update',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: KmodiPaddin,
                    ),
                    Text(
                      "Email",
                    ),
                    Text(
                      snapshot.data[0][0].email,
                      style: TextStyle(fontSize: kTitleSize),
                    ),
                    SizedBox(
                      height: KmodiPaddin,
                    ),
                    /*  SizedBox(
                      width: double.infinity,
                      child: FlatButton.icon(
                        color: Theme.of(context).accentColor,
                        label: Text(
                          "Download Backup",
                        ),
                        icon: Icon(
                          Icons.cloud_download,
                        ),
                        onPressed: () => null,
                      ),
                    ),*/
                    SizedBox(
                      width: double.infinity,
                      child: FlatButton.icon(
                        color: Theme.of(context).accentColor,
                        label: Text(
                          "Log Out",
                        ),
                        icon: Icon(
                          Icons.logout,
                        ),
                        onPressed: () => _signOut(context, auth),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            color: kPrimaryColor,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
