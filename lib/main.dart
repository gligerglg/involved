import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:involved/core/service/dependency_injection.dart' as di;
import 'package:involved/utils/app_colors.dart';

import 'app/involved_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupLocator();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.colorPrimary,
    statusBarColor: AppColors.appColorWhite,
  ));

  runApp(InvolvedApp());
}
