import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpsapp/app/styles/colors.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        leading: IconButton(
            onPressed: Get.back,
            icon: Icon(
              Icons.arrow_back,
              color: gold,
            )),
        title: Text('Signup',
            style: TextStyle(color: gold, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Text(
          'SignupView is working',
          style:
              TextStyle(color: gold, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
