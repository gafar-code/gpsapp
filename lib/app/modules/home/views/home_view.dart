import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpsapp/app/controllers/auth_controller.dart';
import 'package:gpsapp/app/modules/home/views/notification_view.dart';
import 'package:gpsapp/app/modules/home/views/vehicle_view.dart';
import 'package:gpsapp/app/styles/colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AuthController _auth = Get.find<AuthController>();
    return Scaffold(
        backgroundColor: black2,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: size.width,
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 2.5),
                  // color: green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "GPS-APP",
                        style: TextStyle(
                            color: gold,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: _auth.logout,
                        child: CircleAvatar(
                          backgroundColor: gold,
                          child: Icon(
                            Icons.person_rounded,
                            color: black,
                            size: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 100),
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        child: Text(
                          "Pilih kendaraan",
                          style: TextStyle(color: white, fontSize: 20),
                        ),
                      ),
                      VehicleView(),
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 20, 0, 10),
                        child: Text(
                          "Pemberitahuan",
                          style: TextStyle(color: white, fontSize: 20),
                        ),
                      ),
                      NotificationView(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
