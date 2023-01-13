import 'package:behome_mobile/app/common/values/app_constants.dart';
import 'package:behome_mobile/app/model/response/news_response.dart';
import 'package:behome_mobile/app/modules/news/controllers/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/app_images.dart';

class NewsDetailView extends GetView<NewsController> {
  const NewsDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final NewsDataResponse args = Get.arguments;
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
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: SvgPicture.asset(AppImages.icBack),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              "Kabar Berita",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => Visibility(
                            visible: controller.homeController.user.value.role
                                .contains("psikolog"),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      controller.updateNews(args.id),
                                  icon: const Icon(Icons.edit,
                                      color: Colors.yellow),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Hapus Berita",
                                      middleText:
                                          "Apakah anda yakin ingin menghapus berita ini?",
                                      textConfirm: "Ya",
                                      textCancel: "Tidak",
                                      confirmTextColor: Colors.white,
                                      cancelTextColor: Colors.black,
                                      buttonColor: AppColors.primaryColor,
                                      onConfirm: () =>
                                          controller.deleteNews(args.id),
                                      onCancel: () {
                                        Get.closeCurrentSnackbar();
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Container(
                    width: Get.width,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(
                          AppConstants.baseURL + args.newsImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Expanded(
                    child: Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SingleChildScrollView(
                        child: Text(
                          args.description,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
