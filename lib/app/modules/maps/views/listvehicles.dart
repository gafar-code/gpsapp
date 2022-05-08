import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpsapp/app/controllers/vehicle_controller.dart';
import 'package:gpsapp/app/models/vehicle.dart';
import 'package:gpsapp/app/modules/maps/controllers/pageview_controller.dart';
import 'package:gpsapp/app/styles/colors.dart';

class ListVehicle extends GetView<PageViewController> {
  @override
  Widget build(BuildContext context) {
    final _vehicleC = Get.find<VehicleController>();
    return Align(
      alignment: Alignment(0, 1),
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 140,
                width: MediaQuery.of(context).size.width - 160,
                child: PageView(
                  controller: controller.pageController.value,
                  onPageChanged: controller.pageChange,
                  scrollDirection: Axis.horizontal,
                  children: _vehicleFLoatList(_vehicleC.listOfVehicle),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.9, 0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(90),
                  onTap: controller.previewsPage,
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Center(
                      child: Icon(CupertinoIcons.left_chevron,
                          color: white, size: 40),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.9, 0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(90),
                  onTap: controller.nextPage,
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Center(
                      child: Icon(CupertinoIcons.right_chevron,
                          color: white, size: 40),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _vehicleFLoatList(List<Vehicle> list) {
    List<Widget> listVehicle = [];
    for (int i = 0; i < list.length; i++) {
      listVehicle.add(Center(
        child: Container(
          width: 150,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: grey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(flex: 2),
              CircleAvatar(radius: 24),
              Spacer(flex: 1),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    list[i].name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(list[i].platNumb),
                ],
              ),
              Spacer(flex: 4),
            ],
          ),
        ),
      ));
    }
    return listVehicle;
  }
}
