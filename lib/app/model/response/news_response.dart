import 'dart:convert';

NewsResponse newsResponseFromJson(String str) =>
    NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) => json.encode(data.toJson());

class NewsResponse {
  NewsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<NewsDataResponse> data;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        message: json["message"],
        data: List<NewsDataResponse>.from(
            json["data"].map((x) => NewsDataResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class NewsDataResponse {
  NewsDataResponse({
    required this.id,
    required this.newsImage,
    required this.description,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String newsImage;
  String description;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory NewsDataResponse.fromJson(Map<String, dynamic> json) =>
      NewsDataResponse(
        id: json["id"],
        newsImage: json["news_image"],
        description: json["description"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "news_image": newsImage,
        "description": description,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
