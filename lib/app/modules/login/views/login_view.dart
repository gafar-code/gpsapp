import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpsapp/app/components/button/button.dart';
import 'package:gpsapp/app/routes/app_pages.dart';
import 'package:gpsapp/app/styles/colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: _size.height / 2,
            width: _size.width,
            color: gold,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.graphic_eq_sharp, size: 140),
                Text(
                  "Gps App",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: _size.height / 1.8,
            width: _size.width,
            decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome",
                        style: TextStyle(
                            fontSize: 34,
                            color: gold,
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    Text(
                      "back",
                      style: TextStyle(fontSize: 34, color: white),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Obx(
                  () => Column(
                    children: [
                      Container(
                        // form pengisian email
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: controller.emailC,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: grey.withOpacity(0.5)),
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(fontSize: 18, color: white),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: gold)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey.withOpacity(0.5))),
                              prefixIcon: Icon(
                                Icons.mail,
                                size: 22,
                                color: gold,
                              )),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        // form pengisian password
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: controller.passwordC,
                          obscureText: !controller.passwordVisible.value,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(color: grey.withOpacity(0.5)),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: controller.visiblityTogle,
                                  icon: Icon(
                                    controller.passwordVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: gold,
                                  )),
                              labelText: "Sandi",
                              labelStyle: TextStyle(fontSize: 18, color: white),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: gold)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey.withOpacity(0.5))),
                              prefixIcon: Icon(
                                Icons.key,
                                size: 22,
                                color: gold,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 25, 20, 40),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                  color: grey, fontStyle: FontStyle.italic),
                            )),
                      ),
                      ButtonPrimary(controller.inputValidate)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.93),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "don't you have an accounting?",
                style: TextStyle(fontSize: 14, color: grey),
              ),
              SizedBox(width: 8),
              TextButton(
                onPressed: () => Get.toNamed(Routes.SIGNUP),
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14, color: gold),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
