import 'package:behome_mobile/app/data/psikologs_provider.dart';
import 'package:behome_mobile/app/model/response/psikologs_response.dart';
import 'package:behome_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PsikologController extends GetxController {
  // PROVIDER
  final PsikologsProvider psikologsProvider = PsikologsProvider();

  // CONTROLLER
  final HomeController homeController = Get.find<HomeController>();

  // OBSERVABLE
  final psikologs = <PsikologsDataResponse>[].obs;
  final dateController = TextEditingController();

  // FUNCTION
  Future<void> getPsikolog() async {
    try {
      final response = await psikologsProvider.getPsikologs();

      if (response != null) {
        psikologs.assignAll(response);
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  void toggleSchedule(PsikologSchedule item) {
    item.isSelected = !item.isSelected;
    psikologs.refresh();
    update();
  }

  void userSelectSchedule(PsikologSchedule item, int index) {
    // Only One Schedule
    for (var element in psikologs[index].psikologSchedules) {
      element.userSelected = false;
    }

    item.userSelected = true;
    psikologs.refresh();
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getPsikolog();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
