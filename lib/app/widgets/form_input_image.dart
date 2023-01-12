import 'dart:io';

import 'package:behome_mobile/app/common/values/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../common/values/app_colors.dart';
import '../common/values/app_images.dart';

class FormInputImage extends StatelessWidget {
  const FormInputImage(
      {super.key, this.valueImage, this.changeImage, this.resetImage});
  final File? valueImage;
  final Function()? changeImage;
  final Function()? resetImage;

  @override
  Widget build(BuildContext context) {
    return valueImage != null
        ? Container(
            height: Get.height * 0.2,
            width: Get.width * 0.4,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.tertiaryColor.shade700,
              image: DecorationImage(
                image: FileImage(valueImage!),
                fit: BoxFit.cover,
              ),
            ),
            child: GestureDetector(
              onTap: resetImage,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Hapus Foto",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: changeImage,
            child: Container(
              height: Get.height * 0.2,
              width: Get.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.tertiaryColor.shade700,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.icAdd2),
                  const SizedBox(height: 10),
                  Text(
                    'Tambahkan Gambar',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.tertiaryColor,
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
