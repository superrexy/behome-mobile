import 'package:behome_mobile/app/modules/order/controllers/order_controller.dart';
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
    Get.lazyPut<OrderController>(
      () => OrderController(),
    );
  }
}
