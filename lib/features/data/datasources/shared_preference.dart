import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const String _APP_TOKEN = 'app_token';

class AppSharedData {
  SharedPreferences secureStorage;

  AppSharedData(SharedPreferences preferences) {
    secureStorage = preferences;
  }


  ///AppData
  /*bool hasBasicData() {
    return secureStorage.containsKey(_APP_DATA);
  }

  setBasicData(BasicData basicData) {
    secureStorage.setString(_APP_DATA, jsonEncode(basicData.toJson()));
  }

  BasicData getBasicData() {
    return BasicData.fromJson(jsonDecode(secureStorage.getString(_APP_DATA)));
  }

  clearBasicData() {
    secureStorage.remove(_APP_DATA);
  }*/

}
