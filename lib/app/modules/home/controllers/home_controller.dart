import 'package:behome_mobile/app/data/news_provider.dart';
import 'package:get/get.dart';

import '../../../data/users_provider.dart';
import '../../../model/response/news_response.dart';
import '../../../model/response/users_response.dart';

class HomeController extends GetxController {
  // PROVIDER
  final UsersProvider usersProvider = UsersProvider();
  final NewsProvider newsProvider = NewsProvider();

  // OBSERVABLE
  final user = UsersDataResponse(
    id: 0,
    name: '',
    address: '',
    phone: '',
    email: '',
    role: '',
    userImage: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ).obs;
  final news = <NewsDataResponse>[].obs;
  final isSort = false.obs;

  // FUNCTION
  Future<void> getProfile() async {
    try {
      final response = await usersProvider.profile();

      if (response != null) {
        user.update((val) {
          val?.name = response.name;
          val?.address = response.address;
          val?.phone = response.phone;
          val?.email = response.email;
          val?.role = response.role;
          val?.userImage = response.userImage;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getNews() async {
    try {
      final response = await newsProvider.getNews();

      if (response != null) {
        news.assignAll(response);
      }
    } catch (e) {
      print(e);
    }
  }

  void orderByDate(bool asc) async {
    if (asc) {
      news.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    } else {
      news.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getProfile();
    getNews();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
