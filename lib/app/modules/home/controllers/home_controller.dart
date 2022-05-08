// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<bool> isdarkMode = true.obs;
  Rx<ScrollController> scrollController = ScrollController().obs;
  Rx<bool> endScroll = false.obs;

  void switchTheme(bool value) {
    isdarkMode.value = value;
  }

  void scrollToTop() {
    scrollController.value.animateTo(0,
        duration: Duration(seconds: 0), curve: Curves.linearToEaseOut);
  }

  void endScrolling(bool value) {
    print(value);
    endScroll.value = value;
    update();
  }

  @override
  void onClose() {
    scrollController.value.dispose();
    super.onClose();
  }
}
