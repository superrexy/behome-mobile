import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/common/values/app_images.dart';
import 'package:behome_mobile/app/routes/app_pages.dart';
import 'package:behome_mobile/app/widgets/form_button.dart';
import 'package:behome_mobile/app/widgets/form_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.bgLogin),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.15,
            left: Get.width * 0.1,
            right: 0,
            child: Image.asset(
              AppImages.imgLogoWithCircle,
              width: Get.width * 0.6,
              height: Get.width * 0.5,
            ),
          ),
          Positioned(
            top: Get.height * 0.46,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.15,
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        const FormInputField(
                          hintText: 'Username atau Nomer HP',
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.next,
                        ),
                        const FormInputField(
                          hintText: 'Password',
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: true,
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: FormButton(
                                label: 'Masuk',
                                buttonBackgroundColor: AppColors.secondaryColor,
                                onPressed: () => Get.toNamed(Routes.HOME),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                onPressed: () => Get.toNamed(Routes.REGISTER),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color(0xFF031F3D).withOpacity(0.5),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                  ),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "Daftar",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          "Or Sign up With",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppImages.icGoogle,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppImages.icFacebook,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppImages.icApple,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
