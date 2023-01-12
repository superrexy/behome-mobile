import 'dart:convert';
import 'dart:io';

NewsRequest newsRequestFromJson(String str) =>
    NewsRequest.fromJson(json.decode(str));

String newsRequestToJson(NewsRequest data) => json.encode(data.toJson());

class NewsRequest {
  NewsRequest({required this.description, this.newsImage});

  String description;
  File? newsImage;

  factory NewsRequest.fromJson(Map<String, dynamic> json) => NewsRequest(
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
      };
}
