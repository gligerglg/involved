import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/responses/comment_response.dart';

const String _CACHE = '_CACHE';

class AppSharedData {
  SharedPreferences localStorage;

  AppSharedData(SharedPreferences preferences) {
    localStorage = preferences;
  }

  bool hasCacheData() {
    return localStorage.containsKey(_CACHE);
  }

  setCacheData(CommentsResponseData data) {
    localStorage.setString(_CACHE, jsonEncode(data.toJson()));
  }

  CommentsResponseData getCacheData() {
    return CommentsResponseData.fromJson(jsonDecode(localStorage.getString(_CACHE)));
  }

  clearBasicData() {
    localStorage.remove(_CACHE);
  }
}
