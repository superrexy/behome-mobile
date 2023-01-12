import 'dart:convert';

PsikologsResponse psikologsResponseFromJson(String str) =>
    PsikologsResponse.fromJson(json.decode(str));

String psikologsResponseToJson(PsikologsResponse data) =>
    json.encode(data.toJson());

class PsikologsResponse {
  PsikologsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<PsikologsDataResponse> data;

  factory PsikologsResponse.fromJson(Map<String, dynamic> json) =>
      PsikologsResponse(
        status: json["status"],
        message: json["message"],
        data: List<PsikologsDataResponse>.from(
            json["data"].map((x) => PsikologsDataResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PsikologsDataResponse {
  PsikologsDataResponse({
    required this.id,
    required this.name,
    required this.skill,
    this.psikologImage,
    required this.virtualAccountPayment,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.psikologSchedules,
  });

  int id;
  String name;
  String skill;
  String? psikologImage;
  String virtualAccountPayment;
  int userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<PsikologSchedule> psikologSchedules;

  factory PsikologsDataResponse.fromJson(Map<String, dynamic> json) =>
      PsikologsDataResponse(
        id: json["id"],
        name: json["name"],
        skill: json["skill"],
        psikologImage: json["psikolog_image"],
        virtualAccountPayment: json["virtual_account_payment"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        psikologSchedules: List<PsikologSchedule>.from(
            json["psikolog_schedules"]
                .map((x) => PsikologSchedule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "skill": skill,
        "psikolog_image": psikologImage,
        "virtual_account_payment": virtualAccountPayment,
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "psikolog_schedules":
            List<dynamic>.from(psikologSchedules!.map((x) => x.toJson())),
      };
}

class PsikologSchedule {
  PsikologSchedule({
    required this.id,
    required this.time,
    required this.isSelected,
    required this.psikologId,
    this.userSelected = false,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String time;
  bool isSelected;
  bool userSelected;
  int psikologId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PsikologSchedule.fromJson(Map<String, dynamic> json) =>
      PsikologSchedule(
        id: json["id"],
        time: json["time"],
        isSelected: json["is_selected"],
        psikologId: json["psikolog_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time": time,
        "is_selected": isSelected,
        "psikolog_id": psikologId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
