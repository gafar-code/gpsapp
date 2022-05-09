import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:gpsapp/app/controllers/vehicle_controller.dart';
import 'package:gpsapp/app/styles/colors.dart';

class VehicleView extends GetView<VehicleController> {
  @override
  Widget build(BuildContext context) {
    Get.put(VehicleController());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: FutureBuilder<QuerySnapshot<Object?>>(
          future: controller.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<QueryDocumentSnapshot<Object?>> listAllDocs =
                  snapshot.data!.docs;
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: listAllDocs.length,
                  itemBuilder: ((context, index) {
                    return _vehicle((listAllDocs[index].data() as Map)["name"]);
                  }));
            }
            return Center(child: SpinKitThreeBounce(color: gold));
          }),
    );
  }

  Align _vehicle(String title) {
    return Align(
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10),
        height: 130,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(color: grey.withOpacity(0.2)),
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
              title,
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
