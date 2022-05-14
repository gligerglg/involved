import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../domain/entities/response/comment_response_entity.dart';

class CommentParentItem extends StatelessWidget {
  final CommentDataEntity commentDataEntity;

  CommentParentItem({this.commentDataEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(commentDataEntity.creator.url),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${commentDataEntity.creator.firstName} ${commentDataEntity.creator.lastName}',
                  style: const TextStyle(
                      color: AppColors.appIconColorDark,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  '2h',
                  style: TextStyle(
                      color: AppColors.appColorMenuItem,
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                )
              ],
            ),
            commentDataEntity.reactionCount>0?Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(commentDataEntity.reactionCount.toString(), style: TextStyle(
                    color: AppColors.appIconColorDark,
                    fontSize: 11,
                    fontWeight: FontWeight.w400
                ),),
                SizedBox(width: 5,),
                CircleAvatar(
                  backgroundColor: AppColors.appColorWhite,
                  radius: 14,
                  child: CircleAvatar(
                    backgroundColor: AppColors.appColorTextGreen,
                    radius: 12,
                    child: Icon(Icons.favorite, color: AppColors.appColorWhite, size: 10,),
                  ),
                )
              ],
            ):SizedBox.shrink()
          ],
        ),

        // SizedBox(height: 7,),

        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(commentDataEntity.content, style: TextStyle(
                    color: AppColors.appIconColorDark,
                    fontSize: 11,
                    fontWeight: FontWeight.w400
                ),),
              ),

              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Icon(Icons.favorite_border, color: AppColors.appColorMenuItem, size: 16,),
              )
            ],
          ),
        ),
      ],
    );
  }
}
