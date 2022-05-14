import '../../../domain/entities/response/comment_response_entity.dart';

class CommentResponse {
  CommentResponse({
    this.data,
  });

  CommentsResponseData data;

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      CommentResponse(
        data: CommentsResponseData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class CommentsResponseData {
  CommentsResponseData({
    this.items,
  });

  List<CommentData> items;

  factory CommentsResponseData.fromJson(Map<String, dynamic> json) =>
      CommentsResponseData(
        items: List<CommentData>.from(
            json["items"].map((x) => CommentData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class CommentData extends CommentDataEntity {
  CommentData({
    this.id,
    this.reactionCount,
    this.content,
    this.creatorData,
    this.commentType,
    this.replyCommentsData,
  }) : super(
            id: id,
            commentType: commentType,
            content: content,
            creator: creatorData,
            reactionCount: reactionCount,
            replyComments: replyCommentsData);

  int id;
  int reactionCount;
  String content;
  Creator creatorData;
  int commentType;
  List<CommentData> replyCommentsData;

  factory CommentData.fromJson(Map<String, dynamic> json) => CommentData(
        id: json["id"],
        reactionCount: json["reactionCount"],
        content: json["content"],
        creatorData: Creator.fromJson(json["creator"]),
        commentType: json["commentType"],
        replyCommentsData: json["replyComments"] == null
            ? null
            : List<CommentData>.from(
                json["replyComments"].map((x) => CommentData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reactionCount": reactionCount,
        "content": content,
        "creator": creatorData.toJson(),
        "commentType": commentType,
        "replyComments": replyCommentsData == null
            ? null
            : List<dynamic>.from(replyCommentsData.map((x) => x.toJson())),
      };
}

class Creator extends CreatorEntity {
  Creator({
    this.id,
    this.firstName,
    this.lastName,
    this.url,
  }) : super(id: id, firstName: firstName, lastName: lastName, url: url);

  int id;
  String firstName;
  String lastName;
  String url;

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "url": url,
      };
}
