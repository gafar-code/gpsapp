import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpsapp/app/controllers/auth_controller.dart';
import 'package:gpsapp/app/styles/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginController extends GetxController {
  Rx<bool> passwordVisible = false.obs;
  TextEditingController emailC = TextEditingController(text: "demo@demo.com");
  TextEditingController passwordC = TextEditingController(text: "demo123");

  // method untuk hide/show password
  void visiblityTogle() => passwordVisible.value = !passwordVisible.value;
  // method untuk verifikasi input
  void inputValidate() {
    String email = emailC.text;
    String password = passwordC.text;

    if (email.isEmpty) {
      Get.snackbar("Info", "email tidak boleh kosong",
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          backgroundColor: grey,
          shouldIconPulse: true,
          icon: Icon(Icons.info, color: red),
          forwardAnimationCurve: Curves.bounceInOut,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 5);
      return;
    }
    if (password.isEmpty) {
      Get.snackbar("Info", "password tidak boleh kosong",
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          backgroundColor: grey,
          shouldIconPulse: true,
          icon: Icon(Icons.info, color: gold),
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 5);
      return;
    }
    Get.defaultDialog(
        backgroundColor: Colors.transparent,
        title: "",
        middleText: "",
        content: SpinKitThreeBounce(color: gold));
    var auth = Get.find<AuthController>();
    auth.signin(email, password);
    print("finish");
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
