import 'package:behome_mobile/app/data/api_client.dart';
import 'package:behome_mobile/app/data/chats_provider.dart';
import 'package:behome_mobile/app/model/response/chat_response.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../common/values/app_constants.dart';

class ChatController extends GetxController {
  // PROVIDER
  final ChatsProvider chatsProvider = ChatsProvider(ApiClient.init());

  // VARIABLE
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final TextEditingController messageController = TextEditingController();
  final scrollController = ScrollController();

  final user = const User().obs;
  final psikolog = const Psikolog().obs;
  final chats = <Chat>[].obs;

  // FUNCTION
  Future<void> connectSocketChat() async {
    IO.Socket socket = IO.io(AppConstants.baseURL, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.onConnect((_) {
      socket.emit('chat', {
        "chat_id": Get.parameters['orderId']!,
      });
    });

    socket.on('chat', (data) {
      chats.add(Chat.fromJson(data));

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }
      });
    });
  }

  Future<void> getChat() async {
    try {
      final api = await chatsProvider.getChat(Get.parameters['orderId']!);

      if (api.response.statusCode == 200) {
        psikolog.value = Psikolog.fromJson(api.data['data']['psikolog']);
        user.value = User.fromJson(api.data['data']['user']);
        chats.assignAll(api.data['data']['chats']
            .map<Chat>((e) => Chat.fromJson(e))
            .toList());

        user.refresh();
        psikolog.refresh();
        chats.refresh();

        if (chats.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (scrollController.hasClients) {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            }
          });
        }
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  Future<void> sendChat() async {
    try {
      final api = await chatsProvider.sendChat({
        "message": messageController.text,
        "chat_id": Get.parameters['orderId']!,
      });

      if (api.response.statusCode == 201) {
        messageController.clear();
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  @override
  void onReady() {
    connectSocketChat();
    getChat();
    super.onReady();
  }
}
