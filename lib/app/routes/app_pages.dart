import 'package:flutter/animation.dart';

import 'package:get/get.dart';

import 'package:gpsapp/app/modules/detail_vehicle/bindings/detail_vehicle_binding.dart';
import 'package:gpsapp/app/modules/detail_vehicle/views/detail_vehicle_view.dart';
import 'package:gpsapp/app/modules/home/bindings/home_binding.dart';
import 'package:gpsapp/app/modules/home/views/home_view.dart';
import 'package:gpsapp/app/modules/login/bindings/login_binding.dart';
import 'package:gpsapp/app/modules/login/views/login_view.dart';
import 'package:gpsapp/app/modules/maps/bindings/maps_binding.dart';
import 'package:gpsapp/app/modules/maps/views/maps_view.dart';
import 'package:gpsapp/app/modules/navigationbar/bindings/navigationbar_binding.dart';
import 'package:gpsapp/app/modules/navigationbar/views/navigationbar_view.dart';
import 'package:gpsapp/app/modules/profile/bindings/profile_binding.dart';
import 'package:gpsapp/app/modules/profile/views/profile_view.dart';
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
  static const PROFILE = Routes.PROFILE;
  static const DETAIL_VEHICLE = Routes.DETAIL_VEHICLE;

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBinding()),
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
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
        name: _Paths.SPLASH,
        page: () => SplashView(),
        binding: SplashBinding(),
        curve: Curves.fastOutSlowIn),
    GetPage(
      name: _Paths.NAVIGATIONBAR,
      page: () => NavigationbarView(),
      binding: NavigationbarBinding(),
    ),
    GetPage(
      name: _Paths.MAPS,
      page: () => MapsView(),
      binding: MapsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.cupertino,
      curve: Curves.slowMiddle,
    ),
    GetPage(
      name: _Paths.DETAIL_VEHICLE,
      page: () => DetailVehicleView(),
      binding: DetailVehicleBinding(),
    ),
  ];
}
