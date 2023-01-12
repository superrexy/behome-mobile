import 'package:behome_mobile/app/data/psikologs_provider.dart';
import 'package:behome_mobile/app/model/response/psikologs_response.dart';
import 'package:get/get.dart';

class PsikologController extends GetxController {
  // PROVIDER
  final PsikologsProvider usersProvider = PsikologsProvider();

  // OBSERVABLE
  final psikolog = PsikologsDataResponse(
    id: 0,
    name: '',
    psikologImage: '',
    skill: '',
    userId: 0,
    virtualAccountPayment: '',
  ).obs;

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
