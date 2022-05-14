import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:involved/utils/app_colors.dart';
import 'package:involved/utils/navigation_routes.dart';

import '../../../../core/service/dependency_injection.dart';
import '../../../../utils/app_images.dart';
import '../../bloc/post/post_bloc.dart';
import '../base_view.dart';

class SplashView extends BaseView {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseViewState<SplashView> {
  var bloc = injection<PostBloc>();

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, Routes.POST_VIEW);
    });

    super.initState();
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorWhite,
      body: BlocProvider<PostBloc>(
        create: (_) => bloc,
        child: Center(
          child: SvgPicture.asset(
            AppImages.appLogoSvg,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }

  @override
  Bloc getBloc() {
    return bloc;
  }
}
