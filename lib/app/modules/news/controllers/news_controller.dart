import 'dart:io';

import 'package:behome_mobile/app/common/values/app_constants.dart';
import 'package:behome_mobile/app/data/news_provider.dart';
import 'package:behome_mobile/app/model/request/news_request.dart';
import 'package:behome_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:behome_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewsController extends GetxController {
  // CONTROLLER
  final HomeController homeController = Get.find<HomeController>();

  // PROVIDER
  final NewsProvider newsProvider = NewsProvider();

  // FORM
  final formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();

  // FUNCTION
  // Image Picker
  File? image;
  final ImagePicker picker = ImagePicker();
  final isImageFromInternet = false.obs;
  String? imageUrl;

  Future<void> getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    } else {
      print('No image selected.');
    }
  }

  Future<void> resetImage() async {
    isImageFromInternet.value = false;
    image = null;
    update();
  }

  Future<void> onSubmit() async {
    try {
      if (formKey.currentState!.validate()) {
        if (Get.arguments?['isUpdate'] == true) {
          final NewsRequest request = NewsRequest(
            description: descriptionController.text,
            newsImage: image,
          );

          final response =
              await newsProvider.updateNews(Get.arguments?['newsId'], request);

          if (response) {
            await homeController.getNews().then((value) {
              Get.offAllNamed(Routes.HOME);
              Get.snackbar(
                'Berhasil',
                'Berhasil menambahkan kabar berita',
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            });
          }
        } else {
          final NewsRequest request = NewsRequest(
            description: descriptionController.text,
            newsImage: image,
          );

          final response = await newsProvider.createNews(request);

          if (response) {
            await homeController.getNews().then((value) {
              Get.back();
              Get.snackbar(
                'Berhasil',
                'Berhasil menambahkan kabar berita',
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            });
          }
        }
      }
    } catch (e) {
      Get.printError(info: e.toString());
      Get.snackbar(
        'Terdapat Kesalahan',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> updateNews(int newsId) async {
    try {
      final response = await newsProvider.getNewsByID(newsId);

      if (response != null) {
        descriptionController.text = response.description;

        isImageFromInternet.value = true;
        imageUrl = AppConstants.baseURL + response.newsImage;

        update();

        Get.toNamed(Routes.NEWS, arguments: {
          'isUpdate': true,
          'newsId': newsId,
        });
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  Future<void> deleteNews(int newsId) async {
    try {
      final response = await newsProvider.deleteNews(newsId);

      if (response) {
        await homeController.getNews().then((value) {
          Get.back();
          Get.snackbar(
            'Berhasil',
            'Berhasil menghapus kabar berita',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        });
      }
    } catch (e) {
      Get.printError(info: e.toString());
      Get.snackbar(
        'Terdapat Kesalahan',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }



}
