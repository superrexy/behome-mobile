import 'dart:io';

import 'package:behome_mobile/app/data/news_provider.dart';
import 'package:behome_mobile/app/model/request/news_request.dart';
import 'package:behome_mobile/app/modules/home/controllers/home_controller.dart';
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
    image = null;
    update();
  }

  Future<void> onSubmit() async {
    print("OK");
    try {
      if (formKey.currentState!.validate()) {
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

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
