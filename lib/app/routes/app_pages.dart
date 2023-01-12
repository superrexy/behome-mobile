import 'package:behome_mobile/app/modules/order/views/order_success_view.dart';
import 'package:get/get.dart';

import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/authentication/register/bindings/register_binding.dart';
import '../modules/authentication/register/views/register_success_view.dart';
import '../modules/authentication/register/views/register_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/change_email.dart';
import '../modules/profile/views/change_username.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/psikolog/bindings/psikolog_binding.dart';
import '../modules/psikolog/views/edit_psikolog.dart';
import '../modules/psikolog/views/psikolog_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SUCCESS,
      page: () => const RegisterSuccessView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PSIKOLOG,
      page: () => const PsikologView(),
      binding: PsikologBinding(),
    ),
    GetPage(
      name: _Paths.EDITPSIKOLOG,
      page: () => const EditPsikolog(),
      binding: PsikologBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEUSERNAME,
      page: () => const ChangeUsername(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEEMAIL,
      page: () => const ChangeEmail(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_SUCCESS,
      page: () => const OrderSuccessView(),
      binding: OrderBinding(),
    ),
  ];
}
