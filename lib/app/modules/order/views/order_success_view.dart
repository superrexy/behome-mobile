import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/common/values/app_images.dart';
import 'package:behome_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/order_controller.dart';

class OrderSuccessView extends GetView<OrderController> {
  const OrderSuccessView({Key? key}) : super(key: key);
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
                          "Konfirmasi Pembayaran",
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    AppImages.imgSuccess,
                    width: Get.width * 0.65,
                    height: Get.height * 0.37,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Pembayaran Berhasil!',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.psikologController
                        .psikologs[Get.arguments?['index']].name,
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    controller.psikologController
                        .psikologs[Get.arguments?['index']].skill,
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  Text(
                    Get.arguments?['date'],
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 0.7,
                    width: Get.width * 0.6,
                    color: AppColors.secondaryColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Total Pembayaran",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  Text(
                    "Rp 120.000.00",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => Get.offNamed(Routes.HOME),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Chat dengan Psikolog',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
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
