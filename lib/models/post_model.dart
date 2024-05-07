
import 'dart:convert';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  int? userId = 1;
  int? id;
  String title;
  String body;

  PostModel({
    this.userId,
    this.id,
    required this.title,
    required this.body,
  });

  @override
  String toString() {
    return 'PostModel{userId: $userId, id: $id, title: $title, body: $body}';
  }

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
