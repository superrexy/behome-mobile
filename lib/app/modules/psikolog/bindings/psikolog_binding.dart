import 'package:get/get.dart';

import '../controllers/psikolog_controller.dart';

class PsikologBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PsikologController>(
      () => PsikologController(),
    );
  }
}
