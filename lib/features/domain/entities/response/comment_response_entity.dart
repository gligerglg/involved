class CommentDataEntity {
  CommentDataEntity({
    this.id,
    this.reactionCount,
    this.content,
    this.creator,
    this.commentType,
    this.replyComments,
  });

  int id;
  int reactionCount;
  String content;
  CreatorEntity creator;
  int commentType;
  List<CommentDataEntity> replyComments;
}

class CreatorEntity {
  CreatorEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.url,
  });

  int id;
  String firstName;
  String lastName;
  String url;
}
