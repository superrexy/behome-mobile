import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/common/values/app_images.dart';
import 'package:behome_mobile/app/modules/profile/controllers/change_username_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/values/app_constants.dart';

class ChangeUsername extends GetView<ChangeUsernameController> {
  const ChangeUsername({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          "Change Username",
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
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                width: Get.width * 0.4,
                                height: Get.width * 0.4,
                                child: GetBuilder<ChangeUsernameController>(
                                  init: ChangeUsernameController(),
                                  initState: (_) {},
                                  builder: (_) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: controller
                                                  .isImageFromInternet.value
                                              ? NetworkImage(
                                                  AppConstants.baseURL +
                                                      controller
                                                          .homeController
                                                          .user
                                                          .value
                                                          .userImage!,
                                                )
                                              : controller.image != null
                                                  ? FileImage(controller.image!)
                                                  : const AssetImage(
                                                          AppImages.imgUser)
                                                      as ImageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              TextButton(
                                onPressed: () => controller.getImage(),
                                child: const Text("Ganti Foto"),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: Get.width * 0.6,
                                height: Get.height * 0.075,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextFormField(
                                        controller:
                                            controller.usernameController,
                                        keyboardType: TextInputType.name,
                                        decoration: const InputDecoration(
                                          hintText: 'New Username',
                                          fillColor: Colors.white,
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Username tidak boleh kosong';
                                          }

                                          return null;
                                        }),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 22),
                              GestureDetector(
                                onTap: () => controller.onSubmit(),
                                child: Container(
                                  height: 35,
                                  width: Get.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Simpan',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 22),
                            ],
                          ),
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
