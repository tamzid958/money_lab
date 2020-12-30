import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_lab/src/auth/auth.dart';
import 'package:money_lab/src/layouts/loading/loading.dart';
import 'package:money_lab/src/services/provider.dart';
import 'constants.dart';
import 'src/auth/root.dart';

var savedThemeMode;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<FirebaseApp> _initialization;

  @override
  void initState() {
    _initialization = Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return FutureBuilder(
      // Initialize FlutterFire
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // return SomethingWentWrong();
          print('Something went wrong in Flutter Fire');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return AdaptiveApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete

        return LoadingScreen();
      },
    );
  }
}

class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Money Lab',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
          canvasColor: kPrimeDark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: kPrimaryColor,
          accentColor: kAccentColor,
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: kTextLightColor, fontFamily: "Boing"),
        ),
        home: RootPage(),
      ),
    ); //home: HomeScreen(),
  }
}
