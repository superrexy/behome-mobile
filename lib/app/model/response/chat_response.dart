// To parse this JSON data, do
//
//     final chatResponse = chatResponseFromJson(jsonString);

import 'package:behome_mobile/app/common/values/app_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_response.freezed.dart';
part 'chat_response.g.dart';

@freezed
class ChatResponse with _$ChatResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChatResponse({
    Psikolog? psikolog,
    User? user,
    @Default([]) List<Chat>? chats,
  }) = _ChatResponse;

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
}

@freezed
class Chat with _$Chat {
  const factory Chat({
    int? id,
    String? message,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'chat_id') int? chatId,
    DateTime? createdAt,
    DateTime? updatedAt,
    User? user,
    String? from,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}

@freezed
class User with _$User {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory User({
    int? id,
    String? name,
    String? address,
    String? phone,
    String? email,
    String? password,
    String? role,
    String? userImage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  const User._();

  String? get imageUrl =>
      userImage != null ? AppConstants.baseURL + userImage! : null;
}

@freezed
class Psikolog with _$Psikolog {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Psikolog({
    int? id,
    String? name,
    String? skill,
    String? psikologImage,
    String? virtualAccountPayment,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Psikolog;

  factory Psikolog.fromJson(Map<String, dynamic> json) =>
      _$PsikologFromJson(json);

  const Psikolog._();

  String? get imageUrl =>
      psikologImage != null ? AppConstants.baseURL + psikologImage! : null;
}
