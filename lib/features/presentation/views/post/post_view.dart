import 'package:bloc/src/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:involved/features/domain/entities/response/post_entity.dart';
import 'package:involved/utils/app_colors.dart';
import 'package:involved/utils/navigation_routes.dart';

import '../../../../core/service/dependency_injection.dart';
import '../../../../utils/app_images.dart';
import '../../bloc/post/post_bloc.dart';
import '../../common/post/post_item_component.dart';
import '../base_view.dart';

class PostView extends BaseView {
  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends BaseViewState<PostView> {
  var bloc = injection<PostBloc>();

  final _postEntity = PostEntity(
    postImage:
        'https://www.portofpa.com/ImageRepository/Document?documentId=1501',
    location: 'Port Angeles, WA',
    userName: 'Rose Palmer',
    profileImagePath:
        'https://www.himalmag.com/wp-content/uploads/2019/07/sample-profile-picture.png',
    postDescription:
        'This was a better experience than I expected. This was a comfortable, relaxing way to travel to Victoria. The staff was friendly and helpful. It was great to have the ability to purchase refreshments onboard.',
  );

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PostBloc>(
        create: (_) => bloc,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  bottom: 21, top: 56, left: 16, right: 16),
              color: AppColors.appColorWhite,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppImages.appLogoPng,
                    width: 102,
                  ),
                  InkResponse(
                    onTap: () {},
                    child: const Icon(
                      Icons.menu_outlined,
                      color: AppColors.appIconColorDark,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 7, right: 7),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      return PostItemComponent(
                        index: index,
                        postEntity: _postEntity,
                        onViewAllComments: () {
                          Navigator.pushNamed(context, Routes.COMMENTS_VIEW,
                              arguments: _postEntity);
                        },
                      );
                    }),
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
