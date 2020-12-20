import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_lab/src/layouts/home/home.dart';
import 'constants.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

var savedThemeMode;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  MyApp({AdaptiveThemeMode savedThemeMode});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

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
              home: HomeScreen(),
            ) //home: HomeScreen(),
        );
  }
}
