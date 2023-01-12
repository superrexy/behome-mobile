import 'package:get/get.dart';

import 'package:behome_mobile/app/modules/profile/controllers/change_username_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeUsernameController>(
      () => ChangeUsernameController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
