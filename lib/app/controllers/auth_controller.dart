import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpsapp/app/routes/app_pages.dart';
import 'package:gpsapp/app/styles/colors.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance; // inisialisasi

  Stream<User?> get streamAuthStats => auth.authStateChanges();
  void signup() {}
  // signin
  Future<void> signin(String email, String password) async {
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(user);
      Get.offAllNamed(Routes.NAVIGATIONBAR);
    } on FirebaseAuthException catch (e) {
      Get.back(closeOverlays: true);
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
            backgroundColor: black,
            contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 30),
            titlePadding: EdgeInsets.only(top: 20),
            titleStyle: TextStyle(color: white),
            middleTextStyle: TextStyle(color: white),
            title: "Upss..",
            middleText:
                "email yang kamu masukan tidak ditemukan, coba gunakan email lain atau mendaftar akun baru pada tautan dibawah");
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
            backgroundColor: black,
            titlePadding: EdgeInsets.only(top: 20),
            titleStyle: TextStyle(color: white),
            middleTextStyle: TextStyle(color: white),
            contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 30),
            title: "Upss..",
            middleText:
                "password yang kamu masukan salah, masukan sandi yang benar atau reset sandi pada tautan dibawah");
      }
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
