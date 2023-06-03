import 'package:behome_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/storage/storage.dart';
import '../../../../common/values/app_constants.dart';
import '../../../../data/authentication_provider.dart';
import '../../../../model/request/login_request.dart';

class LoginController extends GetxController {
  // PROVIDER
  final AuthenticationProvider authenticationProvider =
      AuthenticationProvider();

  // FORM
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // FUNCTION
  Future<void> onSubmit() async {
    try {
      print(Storage.getValue(AppConstants.token));
      if (formKey.currentState!.validate()) {
        final LoginRequest input = LoginRequest(
          email: emailController.text,
          password: passwordController.text,
        );

        print(input.toJson());

        final response = await authenticationProvider.login(input);
        if (response != null) {
          Storage.saveValue(AppConstants.token, response.data.token);
          Get.offAllNamed(Routes.HOME);
          Get.snackbar(
            'Berhasil',
            'Berhasil Masuk',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      Get.printError(info: e.toString());
      Get.snackbar(
        'Terdapat Kesalahan',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void checkToken() {
    if (Storage.hasData(AppConstants.token)) {
      Get.offNamed(Routes.HOME);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }


  @override
  void onReady() {
    checkToken();
    super.onReady();
  }

}
