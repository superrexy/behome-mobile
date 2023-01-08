import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/common/values/app_images.dart';
import 'package:behome_mobile/app/modules/authentication/register/controllers/register_controller.dart';
import 'package:behome_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class RegisterSuccessView extends GetView<RegisterController> {
  const RegisterSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.bgSuccess),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.2,
            left: Get.width * 0.1,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  AppImages.imgSuccess,
                  width: Get.width * 0.7,
                  height: Get.width * 0.65,
                ),
                SizedBox(height: Get.height * 0.035),
                const Text(
                  'Berhasil Mendaftar!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Get.height * 0.015),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.HOME),
                  child: Container(
                    height: Get.height * 0.07,
                    width: Get.width * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.tertiaryColor,
                    ),
                    child: Center(
                      child: SvgPicture.asset(AppImages.icArrowRight),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
