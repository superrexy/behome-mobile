// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromJson(jsonString);

import 'package:behome_mobile/app/common/values/app_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_response.freezed.dart';
part 'users_response.g.dart';

@freezed
class UsersResponse with _$UsersResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UsersResponse({
    int? id,
    String? name,
    String? address,
    String? phone,
    String? email,
    String? role,
    String? userImage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UsersResponse;

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

  const UsersResponse._();

  bool get isAdmin => role == "admin";
  bool get isUser => role == "user";
  bool get isPsikolog => role == "psikolog";

  String? get imageUrl =>
      userImage != null ? AppConstants.baseURL + userImage! : null;
}
