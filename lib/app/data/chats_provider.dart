import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'chats_provider.g.dart';

@RestApi()
abstract class ChatsProvider {
  factory ChatsProvider(Dio dio) = _ChatsProvider;

  @GET("/chats/{chatId}")
  Future<HttpResponse> getChat(@Path() String chatId);

  @POST("/chats")
  Future<HttpResponse> sendChat(@Body() Map<String, dynamic> body);
}
