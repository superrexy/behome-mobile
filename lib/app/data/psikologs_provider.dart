import 'dart:convert';

import 'package:behome_mobile/app/model/request/psikologs_request.dart';
import 'package:behome_mobile/app/model/response/psikologs_response.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'api_client.dart';

class PsikologsProvider {
  final Dio _client = ApiClient.init();

  Future<List<PsikologsDataResponse>?> getPsikologs() async {
    try {
      final Response response = await _client.get("/psikologs");

      if (response.statusCode == 200) {
        final jsonResponse = response.data['data'] as List;
        return jsonResponse
            .map((e) => PsikologsDataResponse.fromJson(e))
            .toList();
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<PsikologsDataResponse?> getPsikologByID(int psikologId) async {
    try {
      final Response response = await _client.get("/psikologs/$psikologId");

      if (response.statusCode == 200) {
        return PsikologsDataResponse.fromJson(response.data['data']);
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<bool> updatePsikologs(int psikologId, PsikologsRequest request) async {
    try {
      if (request.psikologsImage == null) {
        final Response response = await _client
            .put("/psikologs/$psikologId/update", data: request.toJson());

        if (response.statusCode == 200) {
          return true;
        }

        return false;
      }

      final fileName = request.psikologsImage!.path.split('/').last;
      final extFile = fileName.split('.').last;

      final formData = FormData.fromMap({
        "name": request.name,
        "skill": request.skill,
        "virtual_account_payment": request.virtualAccountPayment,
        "schedules": jsonEncode(request.schedules),
        'psikologs_image': MultipartFile.fromBytes(
          request.psikologsImage!.readAsBytesSync(),
          filename: fileName,
          contentType: MediaType('image', extFile),
        ),
      });

      final Response response =
          await _client.put("/psikologs/$psikologId/update", data: formData);

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
