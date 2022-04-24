import 'package:flutter/animation.dart';

import 'package:get/get.dart';

import 'package:gpsapp/app/modules/bottomnavbar/bindings/bottomnavbar_binding.dart';
import 'package:gpsapp/app/modules/bottomnavbar/views/bottomnavbar_view.dart';
import 'package:gpsapp/app/modules/home/bindings/home_binding.dart';
import 'package:gpsapp/app/modules/home/views/home_view.dart';
import 'package:gpsapp/app/modules/login/bindings/login_binding.dart';
import 'package:gpsapp/app/modules/login/views/login_view.dart';
import 'package:gpsapp/app/modules/signup/bindings/signup_binding.dart';
import 'package:gpsapp/app/modules/signup/views/signup_view.dart';
import 'package:gpsapp/app/modules/splash/bindings/splash_binding.dart';
import 'package:gpsapp/app/modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const HOME = Routes.HOME;
  static const LOGIN = Routes.LOGIN;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        curve: Curves.fastOutSlowIn),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: _Paths.SIGNUP,
        page: () => SignupView(),
        binding: SignupBinding(),
        transition: Transition.rightToLeft,
        curve: Curves.fastOutSlowIn),
    GetPage(
        name: _Paths.SPLASH,
        page: () => SplashView(),
        binding: SplashBinding(),
        curve: Curves.fastOutSlowIn),
    GetPage(
      name: _Paths.BOTTOMNAVBAR,
      page: () => BottomnavbarView(),
      binding: BottomnavbarBinding(),
    ),
  ];
}
