import 'dart:io';

import 'package:cartapp/src/app.dart';
import 'package:cartapp/src/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';




main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//  ObjectFactory().setPrefs(sharedPreferences);
//
//  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//  if (Platform.isAndroid) {
//    androidInfo = await deviceInfo.androidInfo;
//    if (androidInfo != null) {
//      ObjectFactory().prefs.setPhoneModel(phoneModel: androidInfo.model);
//    }
//
//    print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
//  } else {
//    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//    print('Running on ${iosInfo.utsname.machine}');
//  }

  ///setting pref

//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Color(0xFF72C2A6),
//  ));
  ///setting device orientation as portrait, then calling the runApp method
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      ChangeNotifierProvider<AppState>(
        create: (context) => AppState(),
        child: new App(sharedPreferences),
      ),
    );
  });
}
