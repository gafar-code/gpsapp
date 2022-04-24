// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<bool> isdarkMode = true.obs;

  void switchTheme(bool value) {
    isdarkMode.value = value;
  }
}
