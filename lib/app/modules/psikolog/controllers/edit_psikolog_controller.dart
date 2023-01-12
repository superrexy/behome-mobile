import 'dart:io';

import 'package:behome_mobile/app/common/values/app_constants.dart';
import 'package:behome_mobile/app/modules/psikolog/controllers/psikolog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/psikologs_provider.dart';
import '../../../model/request/psikologs_request.dart';
import '../../home/controllers/home_controller.dart';

class EditPsikologController extends GetxController {
  // PROVIDER
  final PsikologsProvider psikologsProvider = PsikologsProvider();

  // CONTROLLER
  final HomeController homeController = Get.find<HomeController>();
  final PsikologController psikologController = Get.find<PsikologController>();

  // FORM
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController skillController = TextEditingController();
  final TextEditingController virtualAccountPaymentController =
      TextEditingController();

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
    } else {
      print('No image selected.');
    }

    update();
  }

  Future<void> resetImage() async {
    isImageFromInternet.value = false;
    image = null;
    update();
  }

  Future<void> onSubmit() async {
    try {
      if (formKey.currentState!.validate()) {
        final PsikologsRequest request = PsikologsRequest(
          name: nameController.text,
          schedules: psikologController
              .psikologs[Get.arguments?["index"]].psikologSchedules,
          skill: skillController.text,
          virtualAccountPayment: virtualAccountPaymentController.text,
          psikologsImage: image,
        );

        final response = await psikologsProvider.updatePsikologs(
            Get.arguments?["psikologId"], request);

        if (response) {
          await psikologController.getPsikolog().then((value) {
            Get.back();
            Get.snackbar(
              'Berhasil',
              'Berhasil memperbarui profile psikolog',
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
    nameController.text =
        psikologController.psikologs[Get.arguments?['index']].name;
    skillController.text =
        psikologController.psikologs[Get.arguments?['index']].skill;
    virtualAccountPaymentController.text = psikologController
        .psikologs[Get.arguments?['index']].virtualAccountPayment;
    imageUrl = AppConstants.baseURL +
        psikologController.psikologs[Get.arguments?['index']].psikologImage!;
    isImageFromInternet.value =
        psikologController.psikologs[Get.arguments?['index']].psikologImage !=
                null
            ? true
            : false;

    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    if (Get.arguments?['isUpdate'] == true) {
      formInit();
    }

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
