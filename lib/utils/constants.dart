import 'package:flutter/material.dart';

class Constants {
  static final rupeeSymbol = "\u20B9";
  static const String FEATURE_NOT_AVAILABLE = "Feature not available";

  ///gradients
  static List<Color> kitGradients = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),
    Colors.green,
    Color(0xFFf0f0f0),
  ];

  ///card size
  static const double CARD_HEIGHT = 190;
  static const double CARD_WIDTH = 160;
  

  ///error
  static const String SOME_ERROR_OCCURRED = "Some error occurred.";

  ///login
  static const String LOGIN_LABEL_TEXT = "Outlook ID";
  static const String LOGIN_PASSWORD_LABEL_TEXT = "Password";
  static const String LOGIN_HELPER_TEXT = "Please enter your Outlook ID";
  static const String LOGIN_PASSWORD_HELPER_TEXT = "Minimum 6 characters.";
  static const String LOGIN_CONFIRMATION_TEXT = "Do you really want to logout?";
  static const String LOGOUT_TEXT = "Logout";
  static const String LOGOUT_TITLE = "Enter Login Details";

  /// image url
  static const String APP_LOGO = 'assets/icon/login_logo.png';
  
  ///dialog
  static const String CANCEL = "Cancel";
  static const String OK = "Ok";
  static const String YES = "Yes";
  static const String CLOSE = "Close";
  static const String UPDATE = "Update";
  static const String ORDER_CANCELLATION = "Confirm order cancellation?";

  static const String NO_DATA_TEXT = "Nothing to show here";
  static const String POWERED_BY = "powered by ";

  ///settings
  static const String SETTINGS_TITLE = "Settings";
  static const String PRIVACY_POLICY = "Privacy policy";
  static const String SETTING_TERMS_CONDITION = "Terms & conditions";

  
  
  ///validators
  static const String EMAIL_NOT_VALID = "Email is not valid";
  static const String USERNAME_NOT_VALID = "Username is not valid";
  static const String PASSWORD_LENGTH =
      "Password length should be greater than 5 chars.";
  static const String INVALID_MOBILE_NUM = "Invalid mobile number";
  static const String INVALID_NAME = "Invalid name";

 


}
