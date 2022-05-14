import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:involved/error/failures.dart';
import 'package:involved/features/domain/entities/response/comment_response_entity.dart';

import '../../../core/network/network_info.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';
import '../models/common/common_error_response.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CommentDataEntity>>> getComments() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getComments();
        localDataSource.cacheCommentData(response.data);
        return Right(response.data.items);
      } catch (e) {
        return Left(
            ServerFailure(ErrorResponseModel(responseError: e.toString(),),),);
      }
    } else {
      if (localDataSource.hasCacheData()) {
        return Right(localDataSource.getCachedComments().items);
      } else {
        return Left(ConnectionFailure());
      }
    }
  }
}
