import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../model/request/users_request.dart';
import '../model/response/users_response.dart';
import 'api_client.dart';

class UsersProvider {
  final Dio _client = ApiClient.init();

  Future<UsersDataResponse?> profile() async {
    try {
      final Response response = await _client.get("/users/profile");

      if (response.statusCode == 200) {
        return UsersDataResponse.fromJson(response.data['data']);
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<UsersDataResponse?> updateProfile(UsersRequest request) async {
    try {
      if (request.userImage != null) {
        final fileName = request.userImage!.path.split('/').last;
        final extFile = fileName.split('.').last;

        final formData = FormData.fromMap({
          'name': request.name,
          'user_image': MultipartFile.fromBytes(
            request.userImage!.readAsBytesSync(),
            filename: fileName,
            contentType: MediaType('image', extFile),
          ),
        });

        final Response response =
            await _client.put("/users/profile", data: formData);

        if (response.statusCode == 200) {
          return UsersDataResponse.fromJson(response.data['data']);
        }

        return null;
      }

      final Response response =
          await _client.put("/users/profile", data: request.toJson());

      if (response.statusCode == 200) {
        return UsersDataResponse.fromJson(response.data['data']);
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
