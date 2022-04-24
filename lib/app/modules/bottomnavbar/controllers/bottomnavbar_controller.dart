import 'package:get/get.dart';

class BottomnavbarController extends GetxController {
  Rx<int> tabIndex = 0.obs;
  void changeIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
