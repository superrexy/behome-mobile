// To parse this JSON data, do
//
//     final orderResponse = orderResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_response.freezed.dart';
part 'order_response.g.dart';

@freezed
class OrderResponse with _$OrderResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrderResponse({
    int? id,
    @JsonKey(name: 'psikolog_id') int? psikologId,
    int? userId,
    @JsonKey(name: 'is_closed') bool? isClosed,
    @JsonKey(name: 'is_finished') bool? isFinished,
    @JsonKey(name: 'schedule_id') int? scheduleId,
    @JsonKey(name: 'consultation_day') DateTime? consultationDay,
    DateTime? createdAt,
    DateTime? updatedAt,
    Psikolog? psikolog,
    Schedule? schedule,
    User? user,
  }) = _OrderResponse;

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
}

@freezed
class Psikolog with _$Psikolog {
  const factory Psikolog({
    int? id,
    String? name,
    String? skill,
    @JsonKey(name: 'psikolog_image') String? psikologImage,
  }) = _Psikolog;

  factory Psikolog.fromJson(Map<String, dynamic> json) =>
      _$PsikologFromJson(json);
}

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    int? id,
    String? time,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? name,
    String? email,
    String? phone,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
