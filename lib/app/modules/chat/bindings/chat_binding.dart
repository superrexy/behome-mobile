import 'package:behome_mobile/app/modules/psikolog/controllers/psikolog_controller.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );

    Get.lazyPut<PsikologController>(
      () => PsikologController(),
    );
  }
}
