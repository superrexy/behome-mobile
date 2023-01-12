import 'package:get/get.dart';

import 'package:behome_mobile/app/modules/psikolog/controllers/edit_psikolog_controller.dart';

import '../controllers/psikolog_controller.dart';

class PsikologBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPsikologController>(
      () => EditPsikologController(),
    );
    Get.lazyPut<PsikologController>(
      () => PsikologController(),
    );
  }
}
