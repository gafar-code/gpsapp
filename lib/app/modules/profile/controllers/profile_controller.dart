import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var pinFieldController = TextEditingController(text: "abogobo6");
  var passFieldController = TextEditingController(text: "yeampaw7");
  var pinVisible = true.obs;
  var passVisible = true.obs;

  void pinVisibleToggle() {
    pinVisible.value = !pinVisible.value;
  }

  void passVisibleToggle() {
    passVisible.value = !passVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pinFieldController.dispose();
    passFieldController.dispose();
  }
}
