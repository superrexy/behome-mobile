import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/routes/app_pages.dart';
import 'package:behome_mobile/app/common/values/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
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
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                              title: "Keluar",
                              middleText: "Apakah anda yakin ingin keluar ?",
                              textConfirm: "Ya",
                              textCancel: "Tidak",
                              confirmTextColor: Colors.white,
                              cancelTextColor: Colors.black,
                              buttonColor: AppColors.primaryColor,
                              onConfirm: () {
                                Get.offAllNamed(Routes.LOGIN);
                              },
                            );
                          },
                          child: SvgPicture.asset(AppImages.icExit),
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: Get.width,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.imgCircle2),
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  NetworkImage("https://i.pravatar.cc/300"),
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () => Get.toNamed(Routes.PROFILE),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  "Ubah Profil",
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ),
                              ),
                              const Text(
                                "Selamat Datang !!",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text("Muhamad Syarifudin")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () => Get.toNamed(Routes.PSIKOLOG),
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
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Kabar Berita',
                              style: TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(AppImages.icArrowUpDown),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Container(
                          color: AppColors.secondaryColor,
                          width: Get.width,
                          height: Get.height * 0.002,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: Get.width,
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 30),
                        child: ListView(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: Get.width * 0.27,
                                  height: 60,
                                  color: AppColors.tertiaryColor,
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: Get.width * 0.5,
                                  child: const Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur at sem ac ipsum scelerisque volutpat. ',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: Get.width * 0.27,
                                  height: 60,
                                  color: AppColors.tertiaryColor,
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: Get.width * 0.5,
                                  child: const Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur at sem ac ipsum scelerisque volutpat. ',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: GestureDetector(
                                onTap: () => Get.toNamed(Routes.NEWS),
                                child: SvgPicture.asset(
                                  AppImages.icAdd,
                                ),
                              ),
                            )
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
