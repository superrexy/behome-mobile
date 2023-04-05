import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/common/values/app_images.dart';
import 'package:behome_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../common/values/app_constants.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);
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
                          "Konfirmasi Pemesanan",
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Profile Pemesan",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            controller.homeController.user.value.name ?? "-",
                            style: TextStyle(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 1,
                            width: Get.width,
                            color: AppColors.secondaryColor,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            controller.homeController.user.value.email ?? "-",
                            style: TextStyle(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Detail Pesanan",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: controller
                                                .psikologController
                                                .psikologs[
                                                    Get.arguments?['index']]
                                                .psikologImage !=
                                            null
                                        ? NetworkImage(AppConstants.baseURL +
                                            controller
                                                .psikologController
                                                .psikologs[
                                                    Get.arguments?['index']]
                                                .psikologImage!)
                                        : const AssetImage(AppImages.imgUser)
                                            as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 1,
                                height: 50,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller
                                            .psikologController
                                            .psikologs[Get.arguments?['index']]
                                            .name ??
                                        "-",
                                    style: TextStyle(
                                        color: AppColors.secondaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    controller
                                            .psikologController
                                            .psikologs[Get.arguments?['index']]
                                            .skill ??
                                        "-",
                                    style: TextStyle(
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        controller.psikologController
                                            .dateController.text,
                                        style: TextStyle(
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        controller
                                                .psikologController
                                                .psikologs[
                                                    Get.arguments?['index']]
                                                .psikologSchedules!
                                                .where((val) =>
                                                    val.userSelected == true)
                                                .map((e) => e.time)
                                                .join() ??
                                            "-",
                                        style: TextStyle(
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Metode Pembayaran",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(AppImages.imgDana, height: 25),
                                Text(
                                  controller
                                          .psikologController
                                          .psikologs[Get.arguments?['index']]
                                          .virtualAccountPayment ??
                                      "-",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await Clipboard.setData(
                                      ClipboardData(
                                        text: controller
                                            .psikologController
                                            .psikologs[Get.arguments?['index']]
                                            .virtualAccountPayment,
                                      ),
                                    ).then((value) {
                                      Get.snackbar(
                                        "Berhasil",
                                        "Berhasil menyalin nomor rekening",
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                      );
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Salin',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Total Pembayaran",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Rp 120.000.00",
                            style: TextStyle(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 1,
                            width: Get.width,
                            color: AppColors.secondaryColor,
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: GestureDetector(
                              onTap: () => Get.offAllNamed(Routes.ORDER_SUCCESS,
                                  predicate: (route) =>
                                      route.settings.name == Routes.HOME,
                                  arguments: {
                                    'index': Get.arguments?['index'],
                                    'date': controller
                                        .psikologController
                                        .psikologs[Get.arguments?['index']]
                                        .psikologSchedules
                                        .where(
                                            (val) => val.userSelected == true)
                                        .map((e) => e.time)
                                        .join(),
                                  }),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 10),
                                decoration: BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  'Bayar',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
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
