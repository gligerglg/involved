import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/navigation_routes.dart';

class InvolvedApp extends StatefulWidget {
  @override
  _InvolvedAppState createState() => _InvolvedAppState();
}

class _InvolvedAppState extends State<InvolvedApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      initialRoute: Routes.SPLASH_VIEW,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: AppColors.colorPrimary,
        scaffoldBackgroundColor: AppColors.appBackgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),
      ),
    );
  }
}
