import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:involved/features/presentation/bloc/base_state.dart';
import 'package:involved/features/presentation/bloc/post/post_event.dart';
import 'package:involved/features/presentation/bloc/post/post_state.dart';

import '../base_bloc.dart';

class PostBloc extends Base<PostEvent, BaseState<PostState>>{
  PostBloc() : super(InitialPostState());

  @override
  Stream<BaseState<PostState>> mapEventToState(PostEvent event) async* {
  }
}