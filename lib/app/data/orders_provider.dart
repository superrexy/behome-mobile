import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'orders_provider.g.dart';

@RestApi()
abstract class OrdersProvider {
  factory OrdersProvider(Dio dio) = _OrdersProvider;

  @GET("/order")
  Future<HttpResponse> getOrders();

  @POST("/order")
  Future<HttpResponse> createOrder(@Body() Map<String, dynamic> body);
}
