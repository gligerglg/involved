
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/network/network_info.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  /*@override
  Future<Either<Failure, SplashResponse>> splashRequest(splashRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.splashRequest(splashRequest);
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ErrorResponseModel(responseCode: 'Server exception')));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ErrorResponseModel(responseCode: 'Authorization failure')));
      } on DioException catch (e) {
        return Left(ServerFailure(ErrorResponseModel(responseCode: 'Dio exception ${e.errorResponseModel.responseError}')));
      } catch (e) {
        return Left(ServerFailure(ErrorResponseModel(
            responseError:'Catch ${e}')));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }*/

}
