import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/common/values/app_images.dart';
import 'package:behome_mobile/app/modules/psikolog/controllers/edit_psikolog_controller.dart';
import 'package:behome_mobile/app/widgets/form_input_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/psikolog_controller.dart';

class EditPsikolog extends GetView<EditPsikologController> {
  const EditPsikolog({Key? key}) : super(key: key);
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
                          "Update Profile Psikolog",
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.06,
                                      width: Get.width * 0.4,
                                      child: TextFormField(
                                        controller: controller.nameController,
                                        keyboardType: TextInputType.text,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Nama Lengkap tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Nama Lengkap',
                                          fillColor: AppColors.tertiaryColor,
                                          filled: true,
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    SizedBox(
                                      height: Get.height * 0.06,
                                      width: Get.width * 0.4,
                                      child: TextFormField(
                                        controller: controller.skillController,
                                        keyboardType: TextInputType.text,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Keahlian tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Keahlian',
                                          fillColor: AppColors.tertiaryColor,
                                          filled: true,
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.06,
                                      width: Get.width * 0.4,
                                      child: TextFormField(
                                        controller: controller
                                            .virtualAccountPaymentController,
                                        keyboardType: TextInputType.text,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Virtual Account Payment tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Virtual Account Payment',
                                          fillColor: AppColors.tertiaryColor,
                                          filled: true,
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      height: Get.height * 0.2,
                                      width: Get.width * 0.4,
                                      decoration: BoxDecoration(
                                        color: AppColors.tertiaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Obx(
                                          () => GridView(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent: 20,
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                            ),
                                            children: controller
                                                .psikologController
                                                .psikologs[
                                                    Get.arguments?['index'] ??
                                                        0]
                                                .psikologSchedules
                                                .map(
                                                  (e) => GestureDetector(
                                                    onTap: () => controller
                                                        .psikologController
                                                        .toggleSchedule(e),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: e.isSelected
                                                            ? AppColors
                                                                .secondaryColor
                                                            : Colors.white,
                                                        border: Border.all(
                                                          color: AppColors
                                                              .secondaryColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          e.time,
                                                          style: TextStyle(
                                                            color: e.isSelected
                                                                ? Colors.white
                                                                : Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => Visibility(
                                        visible: !controller
                                            .psikologController
                                            .psikologs[
                                                Get.arguments?['index'] ?? 0]
                                            .psikologSchedules
                                            .any(
                                          (element) => element.isSelected,
                                        ),
                                        child: const Text(
                                          "Jadwal Tidak Boleh Kosong",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GetBuilder<EditPsikologController>(
                                      init: EditPsikologController(),
                                      initState: (_) {},
                                      builder: (_) {
                                        return FormInputImage(
                                          valueImage: controller.image,
                                          changeImage: () =>
                                              controller.getImage(),
                                          resetImage: () =>
                                              controller.resetImage(),
                                          fromInternet: controller
                                              .isImageFromInternet.value,
                                          imageUrl: controller.imageUrl,
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 12),
                                    GestureDetector(
                                      onTap: () => controller.onSubmit(),
                                      child: Container(
                                        height: 50,
                                        width: Get.width * 0.4,
                                        decoration: BoxDecoration(
                                          color: AppColors.secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Update Profile',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
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
