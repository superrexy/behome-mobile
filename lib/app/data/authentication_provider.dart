import 'package:dio/dio.dart';

import '../model/request/login_request.dart';
import '../model/request/register_request.dart';
import '../model/response/login_register_response.dart';
import 'api_client.dart';

class AuthenticationProvider {
  final Dio _client = ApiClient.init();

  Future<LoginRegisterResponse?> register(RegisterRequest request) async {
    try {
      final Response response =
          await _client.post('/auth/register', data: request.toJson());

      if (response.statusCode == 201) {
        return LoginRegisterResponse.fromJson(response.data);
      }

      return null;
    } on DioError catch (e) {
      if (e.response?.data['message'] == "EMAIL_ALREADY_EXISTS") {
        throw "Email sudah terdaftar";
      } else if (e.response?.data['message'] == null) {
        throw "Terjadi kesalahan";
      } else {
        throw e.response?.data['message'];
      }
    }
  }

  Future<LoginRegisterResponse?> login(LoginRequest request) async {
    try {
      final Response response =
          await _client.post('/auth/login', data: request.toJson());

      if (response.statusCode == 200) {
        return LoginRegisterResponse.fromJson(response.data);
      }

      return null;
    } on DioError catch (e) {
      if (e.response?.data['message'] == "INVALID_CREDENTIALS") {
        throw "Email atau password salah";
      } else if (e.response?.data['message'] == "EMAIL_NOT_FOUND") {
        throw "Email tidak ditemukan";
      } else if (e.response?.data['message'] == null) {
        throw "Terjadi kesalahan";
      } else {
        throw e.response?.data['message'];
      }
    }
  }
}
