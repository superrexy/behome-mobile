// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) {
  return _OrderResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderResponse {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'psikolog_id')
  int? get psikologId => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_closed')
  bool? get isClosed => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_finished')
  bool? get isFinished => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_id')
  int? get scheduleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'consultation_day')
  DateTime? get consultationDay => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  Psikolog? get psikolog => throw _privateConstructorUsedError;
  Schedule? get schedule => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderResponseCopyWith<OrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderResponseCopyWith<$Res> {
  factory $OrderResponseCopyWith(
          OrderResponse value, $Res Function(OrderResponse) then) =
      _$OrderResponseCopyWithImpl<$Res, OrderResponse>;
  @useResult
  $Res call(
      {int? id,
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
      User? user});

  $PsikologCopyWith<$Res>? get psikolog;
  $ScheduleCopyWith<$Res>? get schedule;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$OrderResponseCopyWithImpl<$Res, $Val extends OrderResponse>
    implements $OrderResponseCopyWith<$Res> {
  _$OrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? psikologId = freezed,
    Object? userId = freezed,
    Object? isClosed = freezed,
    Object? isFinished = freezed,
    Object? scheduleId = freezed,
    Object? consultationDay = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? psikolog = freezed,
    Object? schedule = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      psikologId: freezed == psikologId
          ? _value.psikologId
          : psikologId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      isClosed: freezed == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFinished: freezed == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool?,
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      consultationDay: freezed == consultationDay
          ? _value.consultationDay
          : consultationDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      psikolog: freezed == psikolog
          ? _value.psikolog
          : psikolog // ignore: cast_nullable_to_non_nullable
              as Psikolog?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PsikologCopyWith<$Res>? get psikolog {
    if (_value.psikolog == null) {
      return null;
    }

    return $PsikologCopyWith<$Res>(_value.psikolog!, (value) {
      return _then(_value.copyWith(psikolog: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<$Res>? get schedule {
    if (_value.schedule == null) {
      return null;
    }

    return $ScheduleCopyWith<$Res>(_value.schedule!, (value) {
      return _then(_value.copyWith(schedule: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderResponseCopyWith<$Res>
    implements $OrderResponseCopyWith<$Res> {
  factory _$$_OrderResponseCopyWith(
          _$_OrderResponse value, $Res Function(_$_OrderResponse) then) =
      __$$_OrderResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
      User? user});

  @override
  $PsikologCopyWith<$Res>? get psikolog;
  @override
  $ScheduleCopyWith<$Res>? get schedule;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_OrderResponseCopyWithImpl<$Res>
    extends _$OrderResponseCopyWithImpl<$Res, _$_OrderResponse>
    implements _$$_OrderResponseCopyWith<$Res> {
  __$$_OrderResponseCopyWithImpl(
      _$_OrderResponse _value, $Res Function(_$_OrderResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? psikologId = freezed,
    Object? userId = freezed,
    Object? isClosed = freezed,
    Object? isFinished = freezed,
    Object? scheduleId = freezed,
    Object? consultationDay = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? psikolog = freezed,
    Object? schedule = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_OrderResponse(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      psikologId: freezed == psikologId
          ? _value.psikologId
          : psikologId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      isClosed: freezed == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFinished: freezed == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool?,
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      consultationDay: freezed == consultationDay
          ? _value.consultationDay
          : consultationDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      psikolog: freezed == psikolog
          ? _value.psikolog
          : psikolog // ignore: cast_nullable_to_non_nullable
              as Psikolog?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_OrderResponse implements _OrderResponse {
  const _$_OrderResponse(
      {this.id,
      @JsonKey(name: 'psikolog_id') this.psikologId,
      this.userId,
      @JsonKey(name: 'is_closed') this.isClosed,
      @JsonKey(name: 'is_finished') this.isFinished,
      @JsonKey(name: 'schedule_id') this.scheduleId,
      @JsonKey(name: 'consultation_day') this.consultationDay,
      this.createdAt,
      this.updatedAt,
      this.psikolog,
      this.schedule,
      this.user});

  factory _$_OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$$_OrderResponseFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'psikolog_id')
  final int? psikologId;
  @override
  final int? userId;
  @override
  @JsonKey(name: 'is_closed')
  final bool? isClosed;
  @override
  @JsonKey(name: 'is_finished')
  final bool? isFinished;
  @override
  @JsonKey(name: 'schedule_id')
  final int? scheduleId;
  @override
  @JsonKey(name: 'consultation_day')
  final DateTime? consultationDay;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final Psikolog? psikolog;
  @override
  final Schedule? schedule;
  @override
  final User? user;

  @override
  String toString() {
    return 'OrderResponse(id: $id, psikologId: $psikologId, userId: $userId, isClosed: $isClosed, isFinished: $isFinished, scheduleId: $scheduleId, consultationDay: $consultationDay, createdAt: $createdAt, updatedAt: $updatedAt, psikolog: $psikolog, schedule: $schedule, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.psikologId, psikologId) ||
                other.psikologId == psikologId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished) &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.consultationDay, consultationDay) ||
                other.consultationDay == consultationDay) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.psikolog, psikolog) ||
                other.psikolog == psikolog) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      psikologId,
      userId,
      isClosed,
      isFinished,
      scheduleId,
      consultationDay,
      createdAt,
      updatedAt,
      psikolog,
      schedule,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderResponseCopyWith<_$_OrderResponse> get copyWith =>
      __$$_OrderResponseCopyWithImpl<_$_OrderResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderResponseToJson(
      this,
    );
  }
}

abstract class _OrderResponse implements OrderResponse {
  const factory _OrderResponse(
      {final int? id,
      @JsonKey(name: 'psikolog_id') final int? psikologId,
      final int? userId,
      @JsonKey(name: 'is_closed') final bool? isClosed,
      @JsonKey(name: 'is_finished') final bool? isFinished,
      @JsonKey(name: 'schedule_id') final int? scheduleId,
      @JsonKey(name: 'consultation_day') final DateTime? consultationDay,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final Psikolog? psikolog,
      final Schedule? schedule,
      final User? user}) = _$_OrderResponse;

  factory _OrderResponse.fromJson(Map<String, dynamic> json) =
      _$_OrderResponse.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'psikolog_id')
  int? get psikologId;
  @override
  int? get userId;
  @override
  @JsonKey(name: 'is_closed')
  bool? get isClosed;
  @override
  @JsonKey(name: 'is_finished')
  bool? get isFinished;
  @override
  @JsonKey(name: 'schedule_id')
  int? get scheduleId;
  @override
  @JsonKey(name: 'consultation_day')
  DateTime? get consultationDay;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  Psikolog? get psikolog;
  @override
  Schedule? get schedule;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$_OrderResponseCopyWith<_$_OrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Psikolog _$PsikologFromJson(Map<String, dynamic> json) {
  return _Psikolog.fromJson(json);
}

/// @nodoc
mixin _$Psikolog {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get skill => throw _privateConstructorUsedError;
  @JsonKey(name: 'psikolog_image')
  String? get psikologImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PsikologCopyWith<Psikolog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PsikologCopyWith<$Res> {
  factory $PsikologCopyWith(Psikolog value, $Res Function(Psikolog) then) =
      _$PsikologCopyWithImpl<$Res, Psikolog>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? skill,
      @JsonKey(name: 'psikolog_image') String? psikologImage});
}

/// @nodoc
class _$PsikologCopyWithImpl<$Res, $Val extends Psikolog>
    implements $PsikologCopyWith<$Res> {
  _$PsikologCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? skill = freezed,
    Object? psikologImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      skill: freezed == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as String?,
      psikologImage: freezed == psikologImage
          ? _value.psikologImage
          : psikologImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PsikologCopyWith<$Res> implements $PsikologCopyWith<$Res> {
  factory _$$_PsikologCopyWith(
          _$_Psikolog value, $Res Function(_$_Psikolog) then) =
      __$$_PsikologCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? skill,
      @JsonKey(name: 'psikolog_image') String? psikologImage});
}

/// @nodoc
class __$$_PsikologCopyWithImpl<$Res>
    extends _$PsikologCopyWithImpl<$Res, _$_Psikolog>
    implements _$$_PsikologCopyWith<$Res> {
  __$$_PsikologCopyWithImpl(
      _$_Psikolog _value, $Res Function(_$_Psikolog) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? skill = freezed,
    Object? psikologImage = freezed,
  }) {
    return _then(_$_Psikolog(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      skill: freezed == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as String?,
      psikologImage: freezed == psikologImage
          ? _value.psikologImage
          : psikologImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Psikolog implements _Psikolog {
  const _$_Psikolog(
      {this.id,
      this.name,
      this.skill,
      @JsonKey(name: 'psikolog_image') this.psikologImage});

  factory _$_Psikolog.fromJson(Map<String, dynamic> json) =>
      _$$_PsikologFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? skill;
  @override
  @JsonKey(name: 'psikolog_image')
  final String? psikologImage;

  @override
  String toString() {
    return 'Psikolog(id: $id, name: $name, skill: $skill, psikologImage: $psikologImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Psikolog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.skill, skill) || other.skill == skill) &&
            (identical(other.psikologImage, psikologImage) ||
                other.psikologImage == psikologImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, skill, psikologImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PsikologCopyWith<_$_Psikolog> get copyWith =>
      __$$_PsikologCopyWithImpl<_$_Psikolog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PsikologToJson(
      this,
    );
  }
}

abstract class _Psikolog implements Psikolog {
  const factory _Psikolog(
          {final int? id,
          final String? name,
          final String? skill,
          @JsonKey(name: 'psikolog_image') final String? psikologImage}) =
      _$_Psikolog;

  factory _Psikolog.fromJson(Map<String, dynamic> json) = _$_Psikolog.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get skill;
  @override
  @JsonKey(name: 'psikolog_image')
  String? get psikologImage;
  @override
  @JsonKey(ignore: true)
  _$$_PsikologCopyWith<_$_Psikolog> get copyWith =>
      throw _privateConstructorUsedError;
}

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  int? get id => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call({int? id, String? time});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScheduleCopyWith<$Res> implements $ScheduleCopyWith<$Res> {
  factory _$$_ScheduleCopyWith(
          _$_Schedule value, $Res Function(_$_Schedule) then) =
      __$$_ScheduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? time});
}

/// @nodoc
class __$$_ScheduleCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$_Schedule>
    implements _$$_ScheduleCopyWith<$Res> {
  __$$_ScheduleCopyWithImpl(
      _$_Schedule _value, $Res Function(_$_Schedule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_Schedule(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Schedule implements _Schedule {
  const _$_Schedule({this.id, this.time});

  factory _$_Schedule.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleFromJson(json);

  @override
  final int? id;
  @override
  final String? time;

  @override
  String toString() {
    return 'Schedule(id: $id, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Schedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      __$$_ScheduleCopyWithImpl<_$_Schedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleToJson(
      this,
    );
  }
}

abstract class _Schedule implements Schedule {
  const factory _Schedule({final int? id, final String? time}) = _$_Schedule;

  factory _Schedule.fromJson(Map<String, dynamic> json) = _$_Schedule.fromJson;

  @override
  int? get id;
  @override
  String? get time;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({int? id, String? name, String? email, String? phone});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? email, String? phone});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$_User(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User({this.id, this.name, this.email, this.phone});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phone;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final int? id,
      final String? name,
      final String? email,
      final String? phone}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
