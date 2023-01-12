import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

class RegisterRequest {
  RegisterRequest({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.password,
  });

  String name;
  String address;
  String phone;
  String email;
  String password;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "phone": phone,
        "email": email,
        "password": password,
      };
}
