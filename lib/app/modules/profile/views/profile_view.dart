import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpsapp/app/controllers/auth_controller.dart';
import 'package:gpsapp/app/styles/colors.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  final _auth = Get.find<AuthController>();
  Widget build(BuildContext context) {
    Get.find<ProfileController>();
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          iconTheme: IconThemeData(color: gold),
          actions: [
            GestureDetector(
              onTap: _auth.logout,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Logout",
                      style: TextStyle(color: red, fontSize: 18),
                    ),
                  ],
                ),
              ),
            )
          ],
          backgroundColor: black,
          title: Text('Profile', style: TextStyle(color: gold)),
          centerTitle: false,
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
          children: [
            SizedBox(height: 30),
            Text("Foto", style: TextStyle(color: grey, fontSize: 18)),
            CircleAvatar(
              radius: 80,
              backgroundColor: grey,
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("informasi", style: TextStyle(color: grey, fontSize: 18)),
                Container(
                  height: 28,
                  width: 60,
                  decoration: BoxDecoration(
                      color: blue, borderRadius: BorderRadius.circular(4)),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.edit,
                        color: white,
                        size: 14,
                      ),
                      Text("ubah", style: TextStyle(color: white, fontSize: 14))
                    ],
                  ),
                ),
              ],
            ),
            Container(
                // tabel data
                margin: EdgeInsets.only(top: 20, bottom: 30),
                height: 160,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _dataProfile("Nama", "Gafar Riskiyanto"),
                    _dataProfile("Alamat", "Jln. Balaidesa No.10"),
                    _dataProfile("Nomor Hp", "+62 85-740-175-812"),
                    _dataProfile("Langganan", "09 April 2022 - 09 April 2055"),
                    _dataProfile("Perangkat", "5 Unit"),
                    _dataProfile("Email", "gafartok@gmail.com"),
                  ],
                )),
            Text("Keamanan", style: TextStyle(color: grey, fontSize: 18)),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 130,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _dataScurity(
                      "Pin",
                      controller.pinFieldController,
                      controller.pinVisible.value,
                      controller.pinVisibleToggle,
                    ),
                    _dataScurity(
                      "Sandi",
                      controller.passFieldController,
                      controller.passVisible.value,
                      controller.passVisibleToggle,
                    ),
                    _dataProfile("Recovery", "tyuipop96@hmail.com")
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80, bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_box_rounded, color: blue),
                  SizedBox(width: 10),
                  Text("Syarat dan ketentuan privasi",
                      style: TextStyle(color: blue, fontSize: 16)),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "dengan menggunakan aplikasi ini berarti anda menyetujui ketentuan privasi yang telah kami tetapkan pada link diatas",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: white),
                ))
          ],
        ));
  }

  Row _dataScurity(
      String key, TextEditingController c, bool obfuscate, Function() onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: 100,
            child: Text(key, style: TextStyle(color: white, fontSize: 16))),
        SizedBox(
            width: 20,
            child: Text(":", style: TextStyle(color: white, fontSize: 16))),
        Row(
          children: [
            SizedBox(
              width: 160,
              height: 35,
              child: TextFormField(
                readOnly: true,
                obscureText: obfuscate,
                obscuringCharacter: "*",
                controller: c,
                style: TextStyle(color: white, fontSize: 14),
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: onTap,
                      child: Icon(
                        obfuscate
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: white,
                        size: 16,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: gold, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: white, width: 1))),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: Text(
                    "ubah",
                    style: TextStyle(color: black, fontSize: 18),
                  ),
                ))
          ],
        ),
        Spacer(flex: 5),
      ],
    );
  }

  Row _dataProfile(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: 90,
            child: Text(key, style: TextStyle(color: white, fontSize: 16))),
        SizedBox(
            width: 20,
            child: Text(":", style: TextStyle(color: white, fontSize: 16))),
        Text(value, style: TextStyle(color: white, fontSize: 16)),
        Spacer(flex: 5),
      ],
    );
  }
}
