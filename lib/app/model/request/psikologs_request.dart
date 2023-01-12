import 'dart:convert';
import 'dart:io';

import 'package:behome_mobile/app/model/response/psikologs_response.dart';

PsikologsRequest psikologsRequestFromJson(String str) =>
    PsikologsRequest.fromJson(json.decode(str));

String psikologsRequestToJson(PsikologsRequest data) =>
    json.encode(data.toJson());

class PsikologsRequest {
  PsikologsRequest({
    required this.name,
    required this.skill,
    required this.virtualAccountPayment,
    required this.schedules,
    this.psikologsImage,
  });

  String name;
  String skill;
  String virtualAccountPayment;
  File? psikologsImage;
  List<PsikologSchedule> schedules;

  factory PsikologsRequest.fromJson(Map<String, dynamic> json) =>
      PsikologsRequest(
        name: json["name"],
        skill: json["skill"],
        virtualAccountPayment: json["virtual_account_payment"],
        schedules: List<PsikologSchedule>.from(
            json["schedules"].map((x) => Schedule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "skill": skill,
        "virtual_account_payment": virtualAccountPayment,
        "schedules": List<dynamic>.from(schedules.map((x) => x.toJson())),
      };
}

class Schedule {
  Schedule({
    required this.id,
    required this.isSelected,
  });

  int id;
  bool isSelected;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        isSelected: json["is_selected"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_selected": isSelected,
      };
}
