import 'package:behome_mobile/app/common/values/app_colors.dart';
import 'package:behome_mobile/app/common/values/app_constants.dart';
import 'package:behome_mobile/app/common/values/app_images.dart';
import 'package:behome_mobile/app/model/response/psikologs_response.dart';
import 'package:flutter/material.dart';
import 'package:behome_mobile/app/routes/app_pages.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PsikologCard extends StatelessWidget {
  const PsikologCard({
    super.key,
    required this.data,
    required this.psikologSchedules,
    this.isAdmin = false,
    this.onTap,
    this.index,
  });
  final PsikologsDataResponse data;
  final List<PsikologSchedule> psikologSchedules;
  final bool isAdmin;
  final Function(PsikologSchedule)? onTap;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.92,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
          const SizedBox(height: 10),
          Text(
            data.name,
            style: TextStyle(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          Text(
            data.skill,
            style: TextStyle(
              color: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(height: 20),
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
                        fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  psikologSchedules.isNotEmpty
                      ? SizedBox(
                          height: Get.height * 0.25,
                          child: GridView(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 30,
                              crossAxisCount: 3,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 15,
                            ),
                            children: psikologSchedules
                                .where((element) => element.isSelected == true)
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () => onTap!(e),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
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
          Visibility(
            visible: !isAdmin,
            child: GestureDetector(
              onTap: () => Get.toNamed(Routes.ORDER, arguments: {
                "index": index,
              }),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
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
