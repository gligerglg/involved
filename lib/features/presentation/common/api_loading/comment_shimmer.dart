import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class CommentShimmerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.appColorTextDark,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 100,
                height: 10,
                color: AppColors.appColorTextDark,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 40),
            width: 200,
            height: 10,
            color: AppColors.appColorTextDark,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.only(left: 40),
            width: 200,
            height: 10,
            color: AppColors.appColorTextDark,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.appColorTextDark,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 100,
                      height: 10,
                      color: AppColors.appColorTextDark,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  width: 200,
                  height: 10,
                  color: AppColors.appColorTextDark,
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.appColorTextDark,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 100,
                      height: 10,
                      color: AppColors.appColorTextDark,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  width: 200,
                  height: 10,
                  color: AppColors.appColorTextDark,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
