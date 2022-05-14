import 'package:involved/features/presentation/bloc/base_state.dart';

import '../../../domain/entities/response/comment_response_entity.dart';

abstract class PostState extends BaseState<PostState>{}

class InitialPostState extends PostState{}

class APILoadingState extends PostState{}

class CommentDataFailedState extends PostState{
  final String error;

  CommentDataFailedState({this.error});
}

class CommentDataSuccessState extends PostState{
  final List<CommentDataEntity> data;

  CommentDataSuccessState({this.data});
}