import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpsapp/app/controllers/vehicle_controller.dart';
import 'package:gpsapp/app/styles/colors.dart';

class StatsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _vehicleC = Get.find<VehicleController>();
    return Align(
      alignment: Alignment(0, -1),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 115,
            padding: EdgeInsets.fromLTRB(20, 40, 20, 5),
            decoration:
                BoxDecoration(color: Colors.grey.shade200.withOpacity(0.1)),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _stats(CupertinoIcons.battery_75_percent, green,
                      "Batrai: ${_vehicleC.currentVehicle.value.battery} %"),
                  _stats(CupertinoIcons.location, blue,
                      "Lokasi: ${_vehicleC.currentVehicle.value.location.latitude}, ${_vehicleC.currentVehicle.value.location.longitude}"),
                  _stats(Icons.query_stats_rounded, gold,
                      "Status: ${_vehicleC.currentVehicle.value.stats}"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _stats(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(color: white),
        ),
      ],
    );
  }
}
