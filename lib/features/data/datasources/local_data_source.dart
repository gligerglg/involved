import 'package:involved/features/data/datasources/shared_preference.dart';
import 'package:meta/meta.dart';

import '../models/responses/comment_response.dart';

abstract class LocalDataSource {
  CommentsResponseData getCachedComments();

  cacheCommentData(CommentsResponseData commentData);

  bool hasCacheData();
}

class LocalDataSourceImpl implements LocalDataSource {
  final AppSharedData sharedPreferences;

  LocalDataSourceImpl({@required this.sharedPreferences});

  @override
  cacheCommentData(CommentsResponseData commentData) {
    sharedPreferences.setCacheData(commentData);
  }

  @override
  CommentsResponseData getCachedComments() {
    return sharedPreferences.getCacheData();
  }

  @override
  bool hasCacheData() {
    return sharedPreferences.hasCacheData();
  }
}
