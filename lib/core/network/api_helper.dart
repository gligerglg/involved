import 'dart:convert';

import 'package:flutter/services.dart';

class APIHelper {
  Future<dynamic> getPostData() async {
    await Future.delayed(const Duration(seconds: 2));
    String data = await rootBundle.loadString('api/data.json');
    return json.decode(data);
  }
}
