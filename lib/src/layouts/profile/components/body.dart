import 'package:flutter/material.dart';
import 'package:money_lab/src/auth/auth.dart';
import 'package:money_lab/constants.dart';
import 'package:money_lab/src/layouts/home/components/myswitch.dart';
import 'package:money_lab/src/layouts/login/login.dart';

class Body extends StatelessWidget {
  final AuthService auth;
  final VoidCallback onSignedOut;
  const Body({Key key, this.auth, this.onSignedOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _signOut() async {
      try {
        await auth.signOut();
        onSignedOut();
        Route route = MaterialPageRoute(builder: (context) => LoginScreen());
        Navigator.pushReplacement(context, route);
      } catch (e) {
        print(e);
      }
    }

    return Container(
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
                      fontSize: kHeadlineSize, fontWeight: FontWeight.bold),
                ),
                MySwitch(),
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
                          backgroundImage: AssetImage(
                            "assets/images/user.png",
                          ),
                          radius: 70.0,
                        ),
                        Text(
                          "User Name",
                          style: TextStyle(color: kOptionalColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      child: Card(
                        color: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(KmodiPaddin),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "\$24350",
                              style: TextStyle(color: kBlackColor),
                            ),
                            OutlineButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(KmodiPaddin * 3)),
                              borderSide: BorderSide(color: kBlackColor),
                              onPressed: () => {},
                              child: Text(
                                'Update',
                                style: TextStyle(color: kBlackColor),
                              ),
                            ),
                          ],
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
              "admin@xilo.com",
              style: TextStyle(fontSize: kTitleSize),
            ),
            SizedBox(
              height: KmodiPaddin,
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton.icon(
                color: Theme.of(context).accentColor,
                label: Text(
                  "Download Backup",
                  style: TextStyle(color: kBlackColor),
                ),
                icon: Icon(Icons.cloud_download, color: kBlackColor),
                onPressed: () => null,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton.icon(
                color: Theme.of(context).accentColor,
                label: Text(
                  "Log Out",
                  style: TextStyle(color: kBlackColor),
                ),
                icon: Icon(Icons.logout, color: kBlackColor),
                onPressed: () => _signOut(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
