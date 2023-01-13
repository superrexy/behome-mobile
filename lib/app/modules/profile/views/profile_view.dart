import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/common/values/app_constants.dart';
import 'package:behome_mobile/app/common/values/app_images.dart';
import 'package:behome_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.bgApp),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(width: Get.width),
                      Positioned(
                        top: 20,
                        left: 10,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: SvgPicture.asset(AppImages.icBack),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.imgLogo),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: Get.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Profile",
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox(
                              width: Get.width * 0.4,
                              height: Get.width * 0.4,
                              child: Obx(
                                () => Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: controller.homeController.user
                                                  .value.userImage !=
                                              null
                                          ? NetworkImage(AppConstants.baseURL +
                                              controller.homeController.user
                                                  .value.userImage!)
                                          : const AssetImage(AppImages.imgUser)
                                              as ImageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: Get.width * 0.6,
                              height: Get.height * 0.095,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Text(
                                          controller
                                              .homeController.user.value.name,
                                          style: TextStyle(
                                              color: AppColors.secondaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            Get.toNamed(Routes.CHANGEUSERNAME),
                                        child: SvgPicture.asset(
                                          AppImages.icEdit,
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 1,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    width: Get.width,
                                    color: AppColors.secondaryColor,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Text(
                                          controller
                                              .homeController.user.value.email,
                                          style: TextStyle(
                                            color: AppColors.secondaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 22),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
