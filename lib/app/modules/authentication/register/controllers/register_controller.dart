import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/storage/storage.dart';
import '../../../../common/values/app_constants.dart';
import '../../../../data/authentication_provider.dart';
import '../../../../model/request/register_request.dart';
import '../../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  // PROVIDER
  final AuthenticationProvider authenticationProvider =
      AuthenticationProvider();

  // FORM
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // FUNCTION
  Future<void> onSubmit() async {
    try {
      if (formKey.currentState!.validate()) {
        final RegisterRequest input = RegisterRequest(
          name: nameController.text,
          address: addressController.text,
          email: emailController.text,
          password: passwordController.text,
          phone: phoneController.text,
        );

        final response = await authenticationProvider.register(input);
        if (response != null) {
          Get.offAllNamed(Routes.REGISTER_SUCCESS);
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

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
