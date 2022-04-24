import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpsapp/app/styles/colors.dart';

class VehicleView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            _vehicle(),
            _vehicle(),
            _vehicle(),
            _vehicle(),
          ],
        ),
      ),
    );
  }

  Align _vehicle() {
    return Align(
      child: Container(
        margin: EdgeInsets.only(right: 10),
        height: 130,
        width: 100,
        decoration: BoxDecoration(
            boxShadow: [],
            color: black2,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(shape: BoxShape.circle, color: grey),
                margin: EdgeInsets.symmetric(vertical: 15),
                child: CircleAvatar(backgroundColor: white)),
            Text(
              "Vario",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.timeline,
                  size: 16,
                  color: grey,
                ),
                SizedBox(width: 5),
                Text(
                  "1.3 Km",
                  style: TextStyle(color: gold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
