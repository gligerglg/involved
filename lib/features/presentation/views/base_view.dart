import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/service/dependency_injection.dart';
import '../../data/datasources/shared_preference.dart';
import '../bloc/base_bloc.dart';
import '../bloc/base_state.dart';

abstract class BaseView extends StatefulWidget {
  BaseView({Key key}) : super(key: key);
}

abstract class BaseViewState<Page extends BaseView> extends State<Page> {
  final appSharedData = injection<AppSharedData>();

  Bloc getBloc();

  Widget buildView(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Base>(
      create: (_) => getBloc(),
      child: BlocListener<Base, BaseState>(
        listener: (context, state) {},
        child: Container(
            margin: EdgeInsets.only(bottom: Platform.isIOS ? 5 : 0),
            child: buildView(context)),
      ),
    );
  }
}
