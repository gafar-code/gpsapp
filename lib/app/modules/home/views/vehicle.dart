import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:gpsapp/app/controllers/vehicle_controller.dart';
import 'package:gpsapp/app/routes/app_pages.dart';
import 'package:gpsapp/app/styles/boxshadow.dart';
import 'package:gpsapp/app/styles/colors.dart';

class VehicleView extends GetView<VehicleController> {
  @override
  Widget build(BuildContext context) {
    Get.put(VehicleController());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: 180,
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

  Widget _vehicle(String title) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.toNamed(AppPages.DETAIL_VEHICLE);
          },
          splashColor: gold,
          highlightColor: gold.withOpacity(0.5),
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(bottom: 10),
            height: 150,
            width: 120,
            decoration: BoxDecoration(
                boxShadow: defaultBoxShadow,
                color: black2,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(2),
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: grey),
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: CircleAvatar(backgroundColor: white, radius: 24)),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.track_changes,
                      size: 16,
                      color: gold,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "1.3 Km",
                      style: TextStyle(color: gold),
                    )
                  ],
                ),
                Spacer(),
                Text(
                  "check",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
