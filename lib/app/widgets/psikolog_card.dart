import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/common/values/app_constants.dart';
import 'package:behome_mobile/app/common/values/app_images.dart';
import 'package:behome_mobile/app/model/response/psikologs_response.dart';
import 'package:flutter/material.dart';
import 'package:behome_mobile/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PsikologCard extends StatelessWidget {
  const PsikologCard({
    super.key,
    required this.data,
    required this.psikologSchedules,
    required this.dateController,
    this.isAdmin = false,
    this.onTap,
    this.index,
  });
  final PsikologsDataResponse data;
  final List<PsikologSchedule> psikologSchedules;
  final bool isAdmin;
  final Function(PsikologSchedule)? onTap;
  final int? index;
  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      margin: const EdgeInsets.only(right: 16).r,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20).r,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: isAdmin,
            child: GestureDetector(
              onTap: () => Get.toNamed(Routes.EDITPSIKOLOG, arguments: {
                "psikologId": data.id,
                "index": index,
                "isUpdate": true
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(AppImages.icSetting),
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.tertiaryColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: data.psikologImage != null
                      ? NetworkImage(AppConstants.baseURL + data.psikologImage!)
                      : const AssetImage(AppImages.imgUser) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            data.name,
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          Text(
            data.skill,
            style: TextStyle(
              color: AppColors.secondaryColor,
            ),
          ),
          SizedBox(height: 20.h),
          Visibility(
            visible: !isAdmin,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Jadwal Konsultasi',
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Pilih Hari",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      hintText: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                          .format(DateTime.now()),
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                    ),
                    readOnly: true,
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: dateController.text.isNotEmpty
                            ? DateFormat('EEEE, dd MMMM yyyy', 'id_ID').parse(
                                dateController.text,
                              )
                            : DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                        locale: const Locale('id', 'ID'),
                      );
                      if (picked != null) {
                        String formattedDate =
                            DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                                .format(picked);

                        dateController.text = formattedDate;
                      }
                    },
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Waktu Tersedia",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  psikologSchedules.isNotEmpty
                      ? Container(
                          constraints: BoxConstraints(
                            maxHeight: 200.h,
                          ),
                          child: GridView(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 30,
                              crossAxisCount: 3,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 15,
                              childAspectRatio: Get.width / Get.height,
                            ),
                            children: psikologSchedules
                                .where((element) => element.isSelected == true)
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () => onTap!(e),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                              vertical: 6)
                                          .r,
                                      decoration: BoxDecoration(
                                        color: e.userSelected
                                            ? AppColors.secondaryColor
                                            : Colors.white,
                                        border: Border.all(
                                          color: AppColors.secondaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          e.time,
                                          style: TextStyle(
                                              color: e.userSelected
                                                  ? Colors.white
                                                  : AppColors.secondaryColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      : const SizedBox(height: 0),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Visibility(
            visible: !isAdmin,
            child: GestureDetector(
              onTap: () {
                if (dateController.text.isNotEmpty &&
                    psikologSchedules
                        .where((element) => element.isSelected == true)
                        .where((element) => element.userSelected == true)
                        .isNotEmpty) {
                  Get.toNamed(Routes.ORDER, arguments: {
                    "index": index,
                  });
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                decoration: BoxDecoration(
                  color: dateController.text.isNotEmpty &&
                          psikologSchedules
                              .where((element) => element.isSelected == true)
                              .where((element) => element.userSelected == true)
                              .isNotEmpty
                      ? AppColors.secondaryColor
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Pesan Layanan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
