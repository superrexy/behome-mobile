import 'package:behome_mobile/app/data/api_client.dart';
import 'package:behome_mobile/app/data/orders_provider.dart';
import 'package:behome_mobile/app/model/response/order_response.dart';
import 'package:get/get.dart';

class ChatsController extends GetxController {
  final orders = <OrderResponse>[].obs;
  final OrdersProvider ordersProvider = OrdersProvider(ApiClient.init());

  Future<void> getOrders() async {
    try {
      final data = await ordersProvider.getOrders();
      if (data.response.statusCode == 200) {
        orders.assignAll(data.data['data'].map<OrderResponse>((e) {
          return OrderResponse.fromJson(e);
        }).toList());
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  void onReady() {
    getOrders();

    super.onReady();
  }

}
