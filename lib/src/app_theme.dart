import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color _iconColor = Colors.black;

//  static Color _iconColor = Color(0xFF72C2A6);

  static const Color _lightPrimaryColor = Color(0xFF000000);
  static const Color _lightPrimaryVariantColor = Colors.white;
  static const Color _lightAccentColor = Color(0xFFFF7600);
  static const Color _lightSecondaryColor = Color(0xFF72C2A6);
  static const Color _lightOnPrimaryColor = Colors.black;

  static const Color _darkPrimaryColor = Colors.white24;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: _lightPrimaryColor,
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    cursorColor: _iconColor,
    accentColor: _lightAccentColor,
    appBarTheme: AppBarTheme(
      color: _lightPrimaryVariantColor,
      iconTheme: IconThemeData(color: _lightOnPrimaryColor),
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightPrimaryVariantColor,
      secondary: _lightSecondaryColor,
      onPrimary: _lightOnPrimaryColor,
    ),
    iconTheme: IconThemeData(
      color: _iconColor,
    ),
    textTheme: _lightTextTheme,
    fontFamily: "SF UI DISPLAY",
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkPrimaryVariantColor,
    appBarTheme: AppBarTheme(
      color: _darkPrimaryVariantColor,
      iconTheme: IconThemeData(color: _darkOnPrimaryColor),
    ),
    colorScheme: ColorScheme.light(
      primary: _darkPrimaryColor,
      primaryVariant: _darkPrimaryVariantColor,
      secondary: _darkSecondaryColor,
      onPrimary: _darkOnPrimaryColor,
    ),
    iconTheme: IconThemeData(
      color: _iconColor,
    ),
    textTheme: _darkTextTheme,
    fontFamily: "SF UI DISPLAY",
  );

  static final TextTheme _lightTextTheme = TextTheme(
      headline5: _lightScreenHeadingTextStyle,
      headline1: _lightScreenSubHeadTextStyle,
      subtitle1: _lightScreenSubTitleTextStyle,
      bodyText1: _lightScreenBody1TextStyle,
      bodyText2: _lightScreenBody2TextStyle,
      button: _lightScreenButtonTextStyle,
      caption: _lightScreenCaptionTextStyle,
      overline: _lightScreenOverLineTextStyle);

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: _darkScreenHeadingTextStyle,
    subtitle1: _lightScreenSubTitleTextStyle,
    bodyText1: _darkScreenTaskNameTextStyle,
    bodyText2: _darkScreenTaskDurationTextStyle,
  );

  static final TextStyle _lightScreenHeadingTextStyle = TextStyle(
      fontSize: 34.0, color: _lightOnPrimaryColor, letterSpacing: 0.25);
  static final TextStyle _lightScreenSubHeadTextStyle = TextStyle(
      fontSize: 24.0,
      color: _lightOnPrimaryColor,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w700);
  static final TextStyle _lightScreenSubTitleTextStyle = TextStyle(
      fontSize: 14.0, color: _lightOnPrimaryColor, letterSpacing: 0.15);
  static final TextStyle _lightScreenBody1TextStyle = TextStyle(
      fontSize: 16.0,
      color: _lightPrimaryColor,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w400);

  static final TextStyle _lightScreenBody2TextStyle = TextStyle(
      fontSize: 14.0,
      color: _lightPrimaryColor,
      letterSpacing: 0.25,
      fontWeight: FontWeight.w300);
  static final TextStyle _lightScreenButtonTextStyle = TextStyle(
      fontSize: 14.0, color: _lightOnPrimaryColor, letterSpacing: 1.25);
  static final TextStyle _lightScreenCaptionTextStyle =
      TextStyle(fontSize: 12.0, color: Color(0xFF858585), letterSpacing: 0.4);
  static final TextStyle _lightScreenOverLineTextStyle =
      TextStyle(fontSize: 10.0, color: Color(0xFF858585), letterSpacing: 1.5);

  static final TextStyle _darkScreenHeadingTextStyle =
      _lightScreenHeadingTextStyle.copyWith(color: _darkOnPrimaryColor);
  static final TextStyle _darkScreenTaskNameTextStyle =
      _lightScreenBody1TextStyle.copyWith(color: _darkOnPrimaryColor);
  static final TextStyle _darkScreenTaskDurationTextStyle =
      _lightScreenBody2TextStyle;
}
