// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpsapp/app/modules/home/bindings/home_binding.dart';
import 'package:gpsapp/app/modules/home/views/home_view.dart';
import 'package:gpsapp/app/modules/maps/bindings/maps_binding.dart';
import 'package:gpsapp/app/modules/maps/views/maps_view.dart';

class NavigationbarController extends GetxController {
  static NavigationbarController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>[
    '/home',
    '/maps',
    '/home',
    '/home',
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.offAndToNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home')
      return GetPageRoute(
        settings: settings,
        page: () => HomeView(),
        transition: Transition.noTransition,
        binding: HomeBinding(),
      );

    if (settings.name == '/maps')
      return GetPageRoute(
        settings: settings,
        page: () => MapsView(),
        transition: Transition.noTransition,
        binding: MapsBinding(),
      );

    return null;
  }
}
