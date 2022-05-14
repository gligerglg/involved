import 'package:flutter/material.dart';
import 'package:involved/features/presentation/views/post/post_view.dart';
import 'package:page_transition/page_transition.dart';
import '../features/presentation/views/comment/comment_view.dart';
import '../features/presentation/views/splash/splash_view.dart';

class Routes {
  static const String SPLASH_VIEW = "SPLASH_VIEW";
  static const String POST_VIEW = "POST_VIEW";
  static const String COMMENTS_VIEW = "COMMENTS_VIEW";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SPLASH_VIEW:
        return PageTransition(
            child: SplashView(), type: PageTransitionType.fade);
      case Routes.POST_VIEW:
        return PageTransition(child: PostView(), type: PageTransitionType.fade);
      case Routes.COMMENTS_VIEW:
        return PageTransition(
            child: CommentsView(postEntity: settings.arguments),
            type: PageTransitionType.fade);
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Invalid Route"),
            ),
          ),
        );
    }
  }
}
