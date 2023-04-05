import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/common/values/app_images.dart';
import 'package:behome_mobile/app/widgets/psikolog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/psikolog_controller.dart';

class PsikologView extends GetView<PsikologController> {
  const PsikologView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bgApp),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20).r,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(AppImages.icBack),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 130.w,
                    height: 130.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.imgLogo),
                      ),
                    ),
                  ),
                ),
                Expanded(child: const SizedBox())
              ],
            ),
            SizedBox(height: 22.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                width: Get.width,
                height: 50.h,
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
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 22.h),
            Container(
              constraints: BoxConstraints(
                maxHeight:
                    controller.homeController.user.value.role != "psikolog"
                        ? 700.h
                        : 350.h,
              ),
              child: GetBuilder<PsikologController>(
                builder: (controller) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final psikolog = controller.psikologs[index];
                      return PsikologCard(
                        index: index,
                        data: psikolog,
                        psikologSchedules: psikolog.psikologSchedules,
                        dateController: controller.dateController,
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
    );
  }
}
