

import '../../data/models/common/common_error_response.dart';

abstract class BaseState<K> {
  const BaseState();
}

class BaseInitial extends BaseState {}

class SessionExpireState<K> extends BaseState<K> {}

class APIFailureState<K> extends BaseState<K> {
  final ErrorResponseModel errorResponseModel;

  APIFailureState({this.errorResponseModel});
}
