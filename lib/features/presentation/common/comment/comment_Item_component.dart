import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../domain/entities/response/comment_response_entity.dart';
import 'comment_parent_item.dart';

class CommentItemComponent extends StatefulWidget {
  final CommentDataEntity commentDataEntity;
  final Function(String) onReply;

  CommentItemComponent({@required this.commentDataEntity, this.onReply});

  @override
  _CommentItemComponentState createState() => _CommentItemComponentState();
}

class _CommentItemComponentState extends State<CommentItemComponent> {
  String _replyButtonText = 'Show Replies';
  bool _isExpanded = false;

  @override
  void initState() {
    if(widget.commentDataEntity.replyComments!=null && widget.commentDataEntity.replyComments.isNotEmpty){
      _replyButtonText = 'Show Replies';
    }else{
      _replyButtonText = 'Reply';
      _isExpanded = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommentParentItem(commentDataEntity: widget.commentDataEntity),

          SizedBox(height: 6,),

          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: InkWell(
              onTap: (){
                if(widget.commentDataEntity.replyComments!=null && widget.commentDataEntity.replyComments.isNotEmpty && !_isExpanded){
                  setState(() {
                    _replyButtonText = 'Reply';
                    _isExpanded = true;
                  });
                }else{
                  widget.onReply('${widget.commentDataEntity.creator.firstName} ${widget.commentDataEntity.creator.lastName}');
                }
              },
              child: Text(_replyButtonText, style: TextStyle(
                color: AppColors.appColorTextGreen,
                fontSize: 12,
                fontWeight: FontWeight.w600
              ),),
            ),
          ),

          if(_isExpanded)
            ...widget.commentDataEntity.replyComments.map((replyComment) => Padding(
              padding: const EdgeInsets.only(left: 40, top: 20),
              child: CommentParentItem(commentDataEntity: replyComment,),
            ),),
        ],
      ),
    );
  }
}
