import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:involved/features/domain/repositories/repository.dart';
import 'package:involved/features/presentation/bloc/base_state.dart';
import 'package:involved/features/presentation/bloc/post/post_event.dart';
import 'package:involved/features/presentation/bloc/post/post_state.dart';

import '../../../../error/failures.dart';
import '../../../data/models/common/common_error_response.dart';
import '../base_bloc.dart';

class PostBloc extends Base<PostEvent, BaseState<PostState>> {
  final Repository repository;

  PostBloc({this.repository}) : super(InitialPostState());

  @override
  Stream<BaseState<PostState>> mapEventToState(PostEvent event) async* {
    if (event is GetCommentDataEvent) {
      yield APILoadingState();
      final result = await repository.getComments();
      yield result.fold((l) {
        return CommentDataFailedState(error: mapFailureToMessage(l));
      }, (r) {
        return CommentDataSuccessState(data: r);
      });
    }
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ConnectionFailure:
        return 'Connection Failure';
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
