import 'package:behome_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:behome_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_images.dart';
import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({Key? key}) : super(key: key);
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
                          "Riwayat",
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
                          horizontal: 12, vertical: 20),
                      width: Get.width,
                      height: Get.height * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Obx(
                        () => ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.orders.length,
                          itemBuilder: (context, index) {
                            final order = controller.orders[index];

                            return Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const CircleAvatar(
                                    backgroundImage:
                                        AssetImage(AppImages.imgLogo),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: Get.find<HomeController>()
                                              .user
                                              .value
                                              .isUser
                                          ? [
                                              Text(
                                                order.psikolog!.name ?? "-",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                order.psikolog!.skill ?? "-",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                order.consultationDay != null &&
                                                        order.schedule != null
                                                    ? "${DateFormat('dd MMMM yyyy').format(order.consultationDay!.toLocal())} ${order.schedule!.time}"
                                                    : "-",
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ]
                                          : [
                                              Text(
                                                order.user!.name ?? "-",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                order.consultationDay != null &&
                                                        order.schedule != null
                                                    ? "${DateFormat('dd MMMM yyyy').format(order.consultationDay!.toLocal())} ${order.schedule!.time}"
                                                    : "-",
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                    ),
                                  ),
                                  const Spacer(),
                                  !order.isFinished!
                                      ? ElevatedButton(
                                          onPressed: () => Get.toNamed(
                                            Routes.CHAT.replaceAll(
                                              ":orderId",
                                              order.id!.toString(),
                                            ),
                                            parameters: {
                                              "orderId": order.id!.toString(),
                                            },
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 30,
                                              vertical: 10,
                                            ),
                                            backgroundColor:
                                                const Color(0xFF031F3D),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: const Text("Chat"),
                                        )
                                      : GestureDetector(
                                          onTap: () => Get.toNamed(
                                            Routes.CHAT.replaceAll(
                                              ":orderId",
                                              order.id!.toString(),
                                            ),
                                            parameters: {
                                              "orderId": order.id!.toString(),
                                            },
                                          ),
                                          child: Text(
                                            "Selesai",
                                            style: TextStyle(
                                              color: AppColors.secondaryColor,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            );
                          },
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
