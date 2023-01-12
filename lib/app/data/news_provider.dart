import 'package:behome_mobile/app/model/request/news_request.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../model/response/news_response.dart';
import 'api_client.dart';

class NewsProvider {
  final Dio _client = ApiClient.init();

  Future<List<NewsDataResponse>?> getNews() async {
    try {
      final Response response = await _client.get("/news");

      if (response.statusCode == 200) {
        final jsonResponse = response.data['data'] as List;
        return jsonResponse.map((e) => NewsDataResponse.fromJson(e)).toList();
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<NewsDataResponse?> getNewsByID(int newsId) async {
    try {
      final Response response = await _client.get("/news/$newsId");

      if (response.statusCode == 200) {
        return NewsDataResponse.fromJson(response.data['data']);
      }

      return null;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<bool> createNews(NewsRequest request) async {
    try {
      final fileName = request.newsImage!.path.split('/').last;
      final extFile = fileName.split('.').last;

      final formData = FormData.fromMap({
        'description': request.description,
        'news_image': MultipartFile.fromBytes(
          request.newsImage!.readAsBytesSync(),
          filename: fileName,
          contentType: MediaType('image', extFile),
        ),
      });

      final Response response =
          await _client.post("/news/create", data: formData);

      if (response.statusCode == 201) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<bool> updateNews(int newsId, NewsRequest request) async {
    try {
      if (request.newsImage == null) {
        final Response response =
            await _client.put("/news/$newsId/update", data: request.toJson());

        if (response.statusCode == 200) {
          return true;
        }

        return false;
      }

      final fileName = request.newsImage!.path.split('/').last;
      final extFile = fileName.split('.').last;

      final formData = FormData.fromMap({
        'description': request.description,
        'car_image': MultipartFile.fromBytes(
          request.newsImage!.readAsBytesSync(),
          filename: fileName,
          contentType: MediaType('image', extFile),
        ),
      });

      final Response response =
          await _client.put("/news/$newsId/update", data: formData);

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<bool> deleteNews(int newsId) async {
    try {
      final Response response = await _client.delete("/news/$newsId/delete");

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
