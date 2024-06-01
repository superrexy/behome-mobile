import 'package:behome_mobile/app/data/orders_provider.dart';
import 'package:behome_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:behome_mobile/app/modules/psikolog/controllers/psikolog_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/api_client.dart';
import '../../../routes/app_pages.dart';

class OrderController extends GetxController {
  // PROVIDER
  final OrdersProvider ordersProvider = OrdersProvider(ApiClient.init());

  // CONTROLLER
  final PsikologController psikologController = Get.find<PsikologController>();
  final HomeController homeController = Get.find<HomeController>();

  // VARIABLE
  int? scheduleId;

  Future<void> createOrder() async {
    try {
      final api = await ordersProvider.createOrder({
        'psikolog_id': psikologController.psikologs[Get.arguments?['index']].id,
        'schedule_id': scheduleId,
        'date': DateFormat('yyyy-MM-dd').format(
          DateTime.parse(DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
              .parse(
                psikologController.dateController.text,
              )
              .toString()),
        ),
      });

      if (api.response.statusCode == 201) {
        Get.offAllNamed(Routes.ORDER_SUCCESS,
            predicate: (route) => route.settings.name == Routes.HOME,
            arguments: {
              'index': Get.arguments?['index'],
              'date': psikologController
                  .psikologs[Get.arguments?['index']].psikologSchedules
                  .where((val) => val.userSelected == true)
                  .map((e) => e.time)
                  .join(),
            });
      }
    } catch (e) {
      Get.snackbar(
        'Gagal',
        'Gagal membuat order',
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onPrimary,
      );
    }
  }
}
