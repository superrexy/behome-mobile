import 'dart:io';

import 'package:behome_mobile/app/data/users_provider.dart';
import 'package:behome_mobile/app/model/request/users_request.dart';
import 'package:behome_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChangeUsernameController extends GetxController {
  // CONTROLLER
  final HomeController homeController = Get.find<HomeController>();

  // PROVIDER
  final UsersProvider usersProvider = UsersProvider();

  // FORM
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();

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
        final UsersRequest request = UsersRequest(
          name: usernameController.text,
          userImage: image,
        );

        final response = await usersProvider.updateProfile(request);

        if (response != null) {
          await homeController.getProfile().then((value) {
            Get.back();
            Get.snackbar(
              'Berhasil',
              'Berhasil memperbarui profile',
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

  void formInit() {
    if (homeController.user.value.userImage != null) {
      isImageFromInternet.value = true;
      imageUrl = homeController.user.value.userImage;
    }

    usernameController.text = homeController.user.value.name;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    formInit();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
