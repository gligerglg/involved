
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';


class InvolvedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget titleWidget;
  final Widget leadingWidget;
  final List<Widget> actions;
  final VoidCallback onBackPressed;

  InvolvedAppBar(
      {this.titleWidget,
        this.leadingWidget,
      this.actions,
      this.onBackPressed})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super();

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget,
      backgroundColor: AppColors.appColorWhite,
      elevation: 0,
      actions: actions,
      centerTitle: false,
      leading: leadingWidget??InkWell(
          onTap: () {
            if (onBackPressed != null) {
              onBackPressed();
            } else {
              Navigator.pop(context);
            }
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.arrow_back,
              color: AppColors.appIconColorDark,
            ),
          ),),
    );
  }
}
