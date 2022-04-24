import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpsapp/app/modules/home/views/notification_view.dart';
import 'package:gpsapp/app/modules/home/views/vehicle_view.dart';
import 'package:gpsapp/app/modules/bottomnavbar/views/bottomnavbar_view.dart';
import 'package:gpsapp/app/styles/colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: black,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: size.width,
                  color: Colors.black,
                  padding: EdgeInsets.fromLTRB(20, 32.5, 20, 2.5),
                  // color: green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gps-App",
                        style: TextStyle(
                            color: gold,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "DarkMode :",
                            style: TextStyle(color: grey.withOpacity(0.5)),
                          ),
                          Obx(
                            () => Switch(
                                activeColor: green,
                                activeTrackColor: green.withOpacity(0.75),
                                inactiveThumbColor: grey.withOpacity(0.1),
                                trackColor: MaterialStateProperty.all<Color>(
                                    green.withOpacity(0.5)),
                                value: controller.isdarkMode.value,
                                onChanged: (value) =>
                                    controller.switchTheme(value)),
                          ),
                        ],
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
                      // Container(
                      //   margin: EdgeInsets.fromLTRB(30, 20, 0, 10),
                      //   child: Text(
                      //     "Pemberitahuan",
                      //     style: TextStyle(color: white, fontSize: 20),
                      //   ),
                      // ),
                      // NotificationView(),
                      // NotificationView(),
                      // NotificationView(),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomnavbarView(),
            )
          ],
        ));
  }
}
