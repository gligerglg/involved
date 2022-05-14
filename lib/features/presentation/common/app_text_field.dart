import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/app_colors.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final Widget icon;
  Widget action;
  final String hint;

  AppTextField(
      {this.controller,
      this.icon,
      this.action,
      this.hint,
      });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  double borderRadius = 16;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          textInputAction: TextInputAction.done,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              hintText: widget.hint,
              counterText: "",
              prefixIcon: widget.icon,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 55,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              suffixIcon: widget.action,
              filled: true,
              hintStyle:  TextStyle(
                  color: AppColors.appIconColorDark.withOpacity(.75), fontSize: 14),
              fillColor: AppColors.appColorFieldBackground),
        ),
      ],
    );
  }
}
