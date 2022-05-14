import 'dart:core';
import 'package:flutter/material.dart';
import 'package:involved/features/data/models/responses/comment_response.dart';

import '../../../core/network/api_helper.dart';

abstract class RemoteDataSource {
  Future<CommentResponse> getComments();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final APIHelper apiHelper;

  RemoteDataSourceImpl({@required this.apiHelper});

  @override
  Future<CommentResponse> getComments() async {
    try {
      final response = await apiHelper.getPostData();
      return CommentResponse.fromJson(response);
    } on Exception {
      rethrow;
    }
  }
}
