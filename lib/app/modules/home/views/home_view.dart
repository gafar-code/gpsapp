import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gpsapp/app/modules/home/views/notification.dart';
import 'package:gpsapp/app/modules/home/views/vehicle.dart';
import 'package:gpsapp/app/styles/boxshadow.dart';
import 'package:gpsapp/app/styles/colors.dart';
import 'package:gpsapp/app/values/strings.dart';

import '../controllers/home_controller.dart';
import 'header.dart';
import 'newscontent.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        children: [
          HeaderWidget(),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: 1,
                controller: controller.scrollController.value,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 100, top: 14),
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 80,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                            color: black2,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: defaultBoxShadow),
                        child: Row(
                          children: [
                            SvgPicture.asset(motorCycle,
                                semanticsLabel: "motorCycle"),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lihat lokasi kendaraan",
                                  style: TextStyle(fontSize: 18, color: white),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.timer,
                                      color: gold,
                                      size: 14,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "2 menit yang lalu",
                                      style:
                                          TextStyle(fontSize: 12, color: white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(CupertinoIcons.right_chevron,
                                color: Colors.white, size: 24)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "Pilih kendaraan",
                                style: TextStyle(color: white, fontSize: 18),
                              ),
                            ),
                            VehicleView(),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "Peringatan",
                                style: TextStyle(color: white, fontSize: 18),
                              ),
                            ),
                            NotificationView(),
                          ],
                        )),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 10),
                      child: Text(
                        "Berita",
                        style: TextStyle(color: white, fontSize: 18),
                      ),
                    ),
                    NewsContent(),
                    NewsContent(),
                    NewsContent(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
