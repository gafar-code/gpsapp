import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpsapp/app/modules/home/views/notification_view.dart';
import 'package:gpsapp/app/modules/home/views/vehicle_view.dart';
import 'package:gpsapp/app/routes/app_pages.dart';
import 'package:gpsapp/app/styles/colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black2,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                padding: EdgeInsets.fromLTRB(20, 50, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GPS-APP",
                      style: TextStyle(
                          color: gold,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 40,
                            width: 200,
                            child: Center(
                              child: TextField(
                                cursorColor: gold,
                                style: TextStyle(color: grey),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: blue,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                        color: gold.withOpacity(0.2),
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: gold,
                                      )),
                                ),
                              ),
                            )),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => Get.toNamed(AppPages.PROFILE),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: gold,
                            child: Icon(
                              Icons.person_rounded,
                              color: black,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    controller: controller.scrollController.value,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 100),
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            color: black,
                            height: 10,
                            width: MediaQuery.of(context).size.width),
                        VehicleView(),
                        Container(
                            color: black,
                            height: 10,
                            width: MediaQuery.of(context).size.width),
                        NotificationView(),
                        Container(
                            color: black,
                            height: 10,
                            width: MediaQuery.of(context).size.width),
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
        ],
      ),
      floatingActionButton: Obx(() => controller.endScroll.value
          ? FloatingActionButton(onPressed: () {})
          : Center()),
    );
  }
}

class NewsContent extends StatelessWidget {
  const NewsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: grey, borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(height: 8),
            Text(
              "Harga mie instant naik",
              style: TextStyle(color: grey, fontSize: 17),
            ),
            SizedBox(height: 5),
            Text(
              "pemerintah mengabarkan harga pokok akan naik, begini tenggapan lesty",
              style: TextStyle(color: grey.withOpacity(0.75), fontSize: 14),
            ),
          ],
        ));
  }
}
