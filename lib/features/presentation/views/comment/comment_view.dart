import 'package:bloc/src/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:involved/features/domain/entities/response/post_entity.dart';
import 'package:involved/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/service/dependency_injection.dart';
import '../../../../utils/app_images.dart';
import '../../../domain/entities/response/comment_response_entity.dart';
import '../../bloc/post/post_bloc.dart';
import '../../common/api_loading/comment_shimmer.dart';
import '../../common/app_text_field.dart';
import '../../common/appbar.dart';
import '../../common/comment/comment_Item_component.dart';
import '../../common/post/post_item_component.dart';
import '../base_view.dart';

class CommentsView extends BaseView {
  final PostEntity postEntity;

  CommentsView({this.postEntity});

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends BaseViewState<CommentsView> {
  var bloc = injection<PostBloc>();
  List<CommentDataEntity> _commentsDataList = [];
  String _replayName = '';
  bool isReplyAvailable = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      appBar: InvolvedAppBar(
        titleWidget: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(widget.postEntity.profileImagePath),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.postEntity.userName,
              style: const TextStyle(
                  color: AppColors.appIconColorDark,
                  fontWeight: FontWeight.w700,
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
      ),
      body: BlocProvider<PostBloc>(
        create: (_) => bloc,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.appColorWhite,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: Text(
                      widget.postEntity.postDescription,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.appColorTextDark,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 6, right: 6, top: 10),
                    child: Chip(
                      label: Text(
                        'Comments',
                        style: TextStyle(
                            color: AppColors.appColorWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      backgroundColor: AppColors.appColorAccent,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImages.icTooltip,
                    width: 10,
                    height: 10,
                    color: AppColors.appColorMenuItem,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'All comments',
                    style: TextStyle(
                        color: AppColors.appColorMenuItem,
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: _isLoading
                    ? Shimmer.fromColors(
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (_, index) => CommentShimmerComponent(),
                        ),
                        enabled: _isLoading,
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, index) {
                          return CommentItemComponent(
                            commentDataEntity: CommentDataEntity(
                                id: 1,
                                reactionCount: 2,
                                commentType: 1,
                                content: 'Have a Nice Day!',
                                replyComments: [
                                  CommentDataEntity(
                                    id: 1,
                                    reactionCount: 1,
                                    content: 'Thank you!',
                                    commentType: 2,
                                    creator: CreatorEntity(
                                        id: 2,
                                        url:
                                            'https://www.himalmag.com/wp-content/uploads/2019/07/sample-profile-picture.png',
                                        firstName: 'Hasith',
                                        lastName: 'Maduranga'),
                                  ),
                                  CommentDataEntity(
                                    id: 1,
                                    reactionCount: 1,
                                    content: 'Wish you a great day!',
                                    commentType: 2,
                                    creator: CreatorEntity(
                                        id: 2,
                                        url:
                                            'https://www.himalmag.com/wp-content/uploads/2019/07/sample-profile-picture.png',
                                        firstName: 'Dilshan',
                                        lastName: 'Pathirathna'),
                                  ),
                                  CommentDataEntity(
                                    id: 1,
                                    reactionCount: 1,
                                    content:
                                        'Great Message. Wish you a good day! and a happy new year',
                                    commentType: 2,
                                    creator: CreatorEntity(
                                        id: 2,
                                        url:
                                            'https://www.himalmag.com/wp-content/uploads/2019/07/sample-profile-picture.png',
                                        firstName: 'Nadun',
                                        lastName: 'Jayamuthu'),
                                  ),
                                ],
                                creator: CreatorEntity(
                                    id: 2,
                                    url:
                                        'https://www.himalmag.com/wp-content/uploads/2019/07/sample-profile-picture.png',
                                    firstName: 'Gayan',
                                    lastName: 'Lakshitha')),
                            onReply: (name) {
                              setState(() {
                                _replayName = name;
                                isReplyAvailable = true;
                              });
                            },
                          );
                        }),
              ),
            ),
            _isLoading?SizedBox.shrink():Container(
              color: AppColors.appColorWhite,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  isReplyAvailable
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.arrow_turn_up_left,
                                  color: AppColors.appColorMenuItem,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Replying to:',
                                  style: TextStyle(
                                      color: AppColors.appColorMenuItem,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  _replayName,
                                  style: TextStyle(
                                      color: AppColors.appIconColorDark,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isReplyAvailable = false;
                                });
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: AppColors.appColorTextGreen,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height: isReplyAvailable ? 10 : 0,
                  ),
                  AppTextField(
                    icon: CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(
                        AppImages.userProfileImage,
                      ),
                    ),
                    hint: 'Add a comment',
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Bloc getBloc() {
    return bloc;
  }
}
