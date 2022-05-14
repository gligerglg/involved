import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:involved/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/app_images.dart';
import '../../../domain/entities/response/post_entity.dart';

class PostItemComponent extends StatefulWidget {
  final int index;
  final PostEntity postEntity;
  final VoidCallback onViewAllComments;

  PostItemComponent(
      {@required this.postEntity, this.onViewAllComments, this.index});

  @override
  State<PostItemComponent> createState() => _PostItemComponentState();
}

class _PostItemComponentState extends State<PostItemComponent> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.index == 0 ? 16 : 0),
            topRight: Radius.circular(widget.index == 0 ? 16 : 0)),
        color: AppColors.appColorWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage(widget.postEntity.profileImagePath),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.postEntity.userName,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.appIconColorDark),
                      ),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.location,
                            color: AppColors.appColorMenuItem,
                            size: 12,
                          ),
                          // SizedBox(width: 5,),
                          Text(
                            widget.postEntity.location,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.appColorMenuItem),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              InkResponse(
                onTap: () {},
                child: const Icon(
                  Icons.more_vert_rounded,
                  color: AppColors.appColorMenuItem,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.postEntity.postDescription,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.appColorTextDark),
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
                height: 220,
                child: Image.network(
                  widget.postEntity.postImage,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: Shimmer.fromColors(
                        child: Container(
                          height: 220,
                          color: AppColors.appColorTextDark,
                        ),
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                      ),
                    );
                  },
                )),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () {
                if (widget.onViewAllComments != null) {
                  widget.onViewAllComments();
                }
              },
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImages.icTooltip,
                    width: 10,
                    height: 10,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'View all comments',
                    style: TextStyle(
                        color: AppColors.appColorTextGreen,
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
