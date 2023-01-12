import 'dart:convert';
import 'dart:io';

UsersRequest usersRequestFromJson(String str) =>
    UsersRequest.fromJson(json.decode(str));

String usersRequestToJson(UsersRequest data) => json.encode(data.toJson());

class UsersRequest {
  UsersRequest({required this.name, this.userImage});

  String name;
  File? userImage;

  factory UsersRequest.fromJson(Map<String, dynamic> json) => UsersRequest(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
