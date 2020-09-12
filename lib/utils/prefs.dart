import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// shared preference storage
class Prefs {
  JsonCodec codec = new JsonCodec();
  SharedPreferences _sharedPreferences;

  static const String _IS_USER_LOADED = "is_user_loaded";
  static const String _IS_FLAT_REQUESTED = "is_flat_requested";

  static const String _AUTH_TOKEN = "auth_token";
  static const String _FCM_TOKEN = "fcm_token";

  static const String _IS_LOGGED_IN = "is_logged_in";

  static const String REQUESTED_FLAT_ID = "requested_flat_id";
  static const String _RECENT_SEARCH_LIST = "recent_search_list";


  Prefs();

  set sharedPreferences(SharedPreferences value) {
    _sharedPreferences = value;
  }

  ///saving  the auth token as a String
  void setAuthToken({String token}) {
    _sharedPreferences.setString(_AUTH_TOKEN, "Token " + token);
  }

  ///get method  for auth token
  String getAuthToken() => _sharedPreferences.getString(_AUTH_TOKEN);

  ///saving  the auth token as a String
  void setFcmToken({String token}) async {
    await _sharedPreferences.setString(_FCM_TOKEN, token);
  }

  ///get method  for auth token
  String getFcmToken() => _sharedPreferences.getString(_FCM_TOKEN);

  ///after login set isLoggedIn true
  ///before logout set isLoggedIn false
  void setIsLoggedIn(bool status) {
    _sharedPreferences.setBool(_IS_LOGGED_IN, status);
  }

  ///checking that is logged in or not
  bool isLoggedIn() => _sharedPreferences.getBool(_IS_LOGGED_IN) != null &&
          _sharedPreferences.getBool(_IS_LOGGED_IN)
      ? true
      : false;

  /// for clearing the data in preference
  void clearPrefs() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  void setIsUserLoaded(bool status) {
    _sharedPreferences.setBool(_IS_USER_LOADED, status);
  }

  /// checking network is available or not
  bool isUserLoaded() => _sharedPreferences.getBool(_IS_USER_LOADED) != null &&
          _sharedPreferences.getBool(_IS_USER_LOADED)
      ? true
      : false;

 void setIsFlatRequested(bool status) {
    _sharedPreferences.setBool(_IS_FLAT_REQUESTED, status);
  }

  /// checking network is available or not
  bool isFlatRequested() => _sharedPreferences.getBool(_IS_FLAT_REQUESTED) != null &&
          _sharedPreferences.getBool(_IS_FLAT_REQUESTED)
      ? true
      : false;

  ///saving  the recent search list
  void saveRecentSearch({List<String> searchList}) {
    _sharedPreferences.setStringList(_RECENT_SEARCH_LIST, searchList);
  }

  ///get method  recent search list
  List<String> getRecentSearchList() =>
      _sharedPreferences.getStringList(_RECENT_SEARCH_LIST);


//  /// Collecting data of add flat form
//  void saveAddFlatData(AddFlatRequestData result) {
//    String jsonString = jsonEncode(result);
//    _sharedPreferences.setString(_FLAT_ADD_DATA, jsonString);
//  }
//
//  AddFlatRequestData getAddFlatData() {
//    Map resultMap = jsonDecode(_sharedPreferences.getString(_FLAT_ADD_DATA));
//    var result = new AddFlatRequestData.fromJson(resultMap);
//    return result;
//  }

}
