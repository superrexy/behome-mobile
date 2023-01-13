import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/common/values/app_images.dart';
import 'package:behome_mobile/app/widgets/psikolog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/psikolog_controller.dart';

class PsikologView extends GetView<PsikologController> {
  const PsikologView({Key? key}) : super(key: key);
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
                          "Informasi Psikolog",
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: !controller.homeController.user.value.role
                              .contains("psikolog")
                          ? Get.height * 0.8
                          : Get.height * 0.45,
                    ),
                    child: GetBuilder<PsikologController>(
                      init: PsikologController(),
                      initState: (_) {},
                      builder: (_) {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            final psikolog = controller.psikologs[index];
                            return PsikologCard(
                              index: index,
                              data: psikolog,
                              psikologSchedules: psikolog.psikologSchedules,
                              onTap: (item) =>
                                  controller.userSelectSchedule(item, index),
                              isAdmin: controller.homeController.user.value.role
                                  .contains("psikolog"),
                            );
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.psikologs.length,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
