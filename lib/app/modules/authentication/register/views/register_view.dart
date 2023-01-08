import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/routes/app_pages.dart';
import 'package:behome_mobile/app/widgets/form_button.dart';
import 'package:behome_mobile/app/widgets/form_input_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 42.0,
          ),
          child: Center(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const FormInputField(
                    isLabelOnly: true,
                    hintText: 'Username atau Nomer HP',
                    textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.next,
                  ),
                  const FormInputField(
                    isLabelOnly: true,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.next,
                  ),
                  const FormInputField(
                    isLabelOnly: true,
                    hintText: 'Alamat Lengkap',
                    textInputAction: TextInputAction.next,
                  ),
                  const FormInputField(
                    isLabelOnly: true,
                    hintText: 'Nomer HP',
                    textInputAction: TextInputAction.next,
                  ),
                  const FormInputField(
                    isLabelOnly: true,
                    hintText: 'Password',
                    textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: FormButton(
                      label: 'Mendaftar',
                      buttonBackgroundColor: AppColors.secondaryColor,
                      onPressed: () => Get.toNamed(Routes.REGISTER_SUCCESS),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
