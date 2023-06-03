// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const REGISTER_SUCCESS = _Paths.REGISTER_SUCCESS;
  static const PSIKOLOG = _Paths.PSIKOLOG;
  static const EDITPSIKOLOG = _Paths.EDITPSIKOLOG;
  static const PROFILE = _Paths.PROFILE;
  static const CHANGEUSERNAME = _Paths.CHANGEUSERNAME;
  static const CHANGEEMAIL = _Paths.CHANGEEMAIL;
  static const NEWS = _Paths.NEWS;
  static const NEWS_DETAIL = _Paths.NEWS_DETAIL;
  static const ORDER = _Paths.ORDER;
  static const ORDER_SUCCESS = _Paths.ORDER_SUCCESS;
  static const CHAT = _Paths.CHAT;
  static const CHATS = _Paths.CHATS;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const REGISTER_SUCCESS = '/register-success';
  static const PSIKOLOG = '/psikolog';
  static const EDITPSIKOLOG = '/edit-psikolog';
  static const PROFILE = '/profile';
  static const CHANGEUSERNAME = '/change-username';
  static const CHANGEEMAIL = '/change-email';
  static const NEWS = '/news';
  static const NEWS_DETAIL = '/news-detail';
  static const ORDER = '/order';
  static const ORDER_SUCCESS = '/order-success';
  static const CHAT = '/chat/:orderId';
  static const CHATS = '/chats';
}
