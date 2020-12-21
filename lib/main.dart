import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_lab/src/auth/auth.dart';
import 'package:money_lab/src/layouts/loading/loading.dart';
import 'constants.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'src/auth/root.dart';

var savedThemeMode;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatefulWidget {
  MyApp({AdaptiveThemeMode savedThemeMode});

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
    return AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.grey,
          primaryColor: kPrimaryColor,
          accentColor: kAccentColor,
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: kTextColor, fontFamily: "Boing"),
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
          primaryColor: kPrimaryColor,
          accentColor: kOptionalColor,
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: kTextLightColor, fontFamily: "Boing"),
        ),
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Money Lab',
              theme: theme,
              darkTheme: darkTheme,
              home: RootPage(auth: AuthService()),
            ) //home: HomeScreen(),
        );
  }
}
