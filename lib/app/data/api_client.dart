import 'package:behome_mobile/app/common/storage/storage.dart';
import 'package:behome_mobile/app/common/values/app_constants.dart';
import 'package:behome_mobile/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static Dio init() {
    final dio = Dio();
    dio.options.baseUrl = AppConstants.baseAPIURL;
    dio.interceptors.add(ApiInterceptors());

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    EasyLoading.show(status: 'Loading ...');

    Get.closeAllSnackbars();

    // Token
    final token = Storage.getValue(AppConstants.token);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    EasyLoading.dismiss();

    if (response.statusCode == 401) {
      Get.snackbar('Session Telah Habis !', 'Silahkan Login Kembali');

      Get.offAllNamed(Routes.LOGIN);
    }

    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    EasyLoading.dismiss();

    if (err.message!.contains('SocketException')) {
      Get.snackbar('Error', 'No Internet Connection');
    } else if (err.message!.contains('HttpException')) {
      Get.snackbar('Error', 'Server Error');
    } else if (err.message!.contains('TimeoutException')) {
      Get.snackbar('Error', 'Connection Timeout');
    }

    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
}
