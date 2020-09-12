
import 'package:cartapp/src/ui/screen/cart/cart_page.dart';
import 'package:cartapp/src/ui/screen/home/bottom_navigation.dart';
import 'package:cartapp/src/ui/screen/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_state.dart';
import 'app_theme.dart';
class App extends StatefulWidget {
  App(SharedPreferences sharedPreferences) {
//    ObjectFactory().setPrefs(sharedPreferences);
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return buildMaterialApp(context);
  }

  Widget buildMaterialApp(BuildContext context) {
    var appState;
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: const <Locale>[
            Locale('en', ''),
            Locale('ar', ''),
            Locale('pt', ''),
            Locale('tr', ''),
          ],
          title: 'Cart App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          home:Login(),
        );
      },
    );
  }
}
