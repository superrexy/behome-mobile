import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/common/values/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
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
            child: Container(
              margin: EdgeInsets.only(top: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.w, vertical: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 61.w,
                                  padding: const EdgeInsets.all(8).r,
                                  decoration: BoxDecoration(
                                    color: AppColors.tertiaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Obx(
                                    () => Center(
                                      child: Get.find<HomeController>()
                                              .user
                                              .value
                                              .isPsikolog
                                          ? controller.user.value.userImage ==
                                                  null
                                              ? Image.asset(
                                                  AppImages.imgUser,
                                                  fit: BoxFit.cover,
                                                  alignment: Alignment.center,
                                                )
                                              : Image.network(
                                                  controller
                                                      .user.value.imageUrl!,
                                                  fit: BoxFit.cover,
                                                  alignment: Alignment.center,
                                                )
                                          : controller.psikolog.value
                                                      .psikologImage ==
                                                  null
                                              ? Image.asset(
                                                  AppImages.imgUser,
                                                  fit: BoxFit.cover,
                                                  alignment: Alignment.center,
                                                )
                                              : Image.network(
                                                  controller
                                                      .psikolog.value.imageUrl!,
                                                  fit: BoxFit.cover,
                                                  alignment: Alignment.center,
                                                ),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Column(
                                    children: Get.find<HomeController>()
                                            .user
                                            .value
                                            .isUser
                                        ? [
                                            Text(
                                              controller.psikolog.value.name ??
                                                  "-",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              controller.psikolog.value.skill ??
                                                  "-",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ]
                                        : [
                                            Text(
                                              controller.user.value.name ?? "-",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                  ),
                                ),
                                const SizedBox()
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black.withOpacity(0.30),
                            thickness: 1.5,
                          ),
                          Expanded(
                            child: Obx(
                              () => ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                controller: controller.scrollController,
                                itemCount: controller.chats.length,
                                itemBuilder: (context, index) {
                                  final chat = controller.chats[index];

                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 25.w, vertical: 10.h),
                                    child: Row(
                                        textDirection: Get.find<
                                                    HomeController>()
                                                .user
                                                .value
                                                .isAdmin
                                            ? (chat.from == "psikolog"
                                                ? TextDirection.rtl
                                                : TextDirection.ltr)
                                            : (chat.userId ==
                                                    Get.find<HomeController>()
                                                        .user
                                                        .value
                                                        .id
                                                ? TextDirection.rtl
                                                : TextDirection.ltr),
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 40.w,
                                            decoration: BoxDecoration(
                                              color: AppColors.tertiaryColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: chat.user?.userImage ==
                                                      null
                                                  ? const CircleAvatar(
                                                      backgroundImage:
                                                          AssetImage(
                                                        AppImages.imgUser,
                                                      ),
                                                    )
                                                  : CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                        chat.user!.imageUrl!,
                                                      ),
                                                    ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                  vertical: 10.h),
                                              decoration: BoxDecoration(
                                                color: AppColors.tertiaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              child: Text(
                                                chat.message ?? "-",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                  );
                                },
                              ),
                            ),
                          ),
                          Visibility(
                            visible:
                                !Get.find<HomeController>().user.value.isAdmin,
                            child: Container(
                              constraints: BoxConstraints(
                                minHeight: 20.h,
                                maxHeight: 40.h,
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 10.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: controller.messageController,
                                      textInputAction: TextInputAction.send,
                                      onSubmitted: (value) =>
                                          controller.sendChat().then((value) {
                                        FocusScope.of(context).unfocus();
                                      }),
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        hintText: 'Ketik Pesan ...',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 13.w, vertical: 8.h),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          borderSide: BorderSide(
                                            color:
                                                Colors.black.withOpacity(0.30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  GestureDetector(
                                    onTap: () => controller.sendChat(),
                                    child: Image.asset(
                                      AppImages.icSend,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
