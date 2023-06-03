// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderResponse _$$_OrderResponseFromJson(Map<String, dynamic> json) =>
    _$_OrderResponse(
      id: json['id'] as int?,
      psikologId: json['psikolog_id'] as int?,
      userId: json['user_id'] as int?,
      isClosed: json['is_closed'] as bool?,
      isFinished: json['is_finished'] as bool?,
      scheduleId: json['schedule_id'] as int?,
      consultationDay: json['consultation_day'] == null
          ? null
          : DateTime.parse(json['consultation_day'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      psikolog: json['psikolog'] == null
          ? null
          : Psikolog.fromJson(json['psikolog'] as Map<String, dynamic>),
      schedule: json['schedule'] == null
          ? null
          : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OrderResponseToJson(_$_OrderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'psikolog_id': instance.psikologId,
      'user_id': instance.userId,
      'is_closed': instance.isClosed,
      'is_finished': instance.isFinished,
      'schedule_id': instance.scheduleId,
      'consultation_day': instance.consultationDay?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'psikolog': instance.psikolog,
      'schedule': instance.schedule,
      'user': instance.user,
    };

_$_Psikolog _$$_PsikologFromJson(Map<String, dynamic> json) => _$_Psikolog(
      id: json['id'] as int?,
      name: json['name'] as String?,
      skill: json['skill'] as String?,
      psikologImage: json['psikolog_image'] as String?,
    );

Map<String, dynamic> _$$_PsikologToJson(_$_Psikolog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'skill': instance.skill,
      'psikolog_image': instance.psikologImage,
    };

_$_Schedule _$$_ScheduleFromJson(Map<String, dynamic> json) => _$_Schedule(
      id: json['id'] as int?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$$_ScheduleToJson(_$_Schedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };
