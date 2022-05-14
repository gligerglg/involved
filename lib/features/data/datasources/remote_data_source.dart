import 'dart:core';
import 'package:flutter/material.dart';

import '../../../core/network/api_helper.dart';

abstract class RemoteDataSource {
  // Future<SplashResponse> splashRequest(SplashRequest splashRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final APIHelper apiHelper;

  RemoteDataSourceImpl({@required this.apiHelper});

  /*@override
  Future<SplashResponse> splashRequest(SplashRequest splashRequest) async {
    try {
      var formData = FormData.fromMap({
        'os_type': splashRequest.osType,
        'build_number': splashRequest.buildNumber,
      });

      final response = await apiHelper.post("version/latest", body: formData);
      return SplashResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }*/
}
