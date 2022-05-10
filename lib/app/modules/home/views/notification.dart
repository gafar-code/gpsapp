import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:gpsapp/app/modules/home/controllers/notification_controller.dart';
import 'package:gpsapp/app/styles/boxshadow.dart';
import 'package:gpsapp/app/styles/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:gpsapp/app/utils/dateformater.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: controller.getRealtime(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          List<QueryDocumentSnapshot<Object?>> listAllDocs =
              snapshot.data!.docs;
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 10, top: 10),
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) {
                // vehicle
                Map<String, dynamic> vehicle =
                    (listAllDocs[index].data() as Map<String, dynamic>);
                // mengambil timestamp database
                int timeStamp =
                    (vehicle['time'] as Timestamp).millisecondsSinceEpoch;
                // jangka waktu dari timestamp database dan current timestamp
                String date = DateFormarter.getTimer(timeStamp);
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    splashColor: vehicle['type'] == "danger"
                        ? red
                        : vehicle['type'] == "warning"
                            ? brown
                            : green,
                    highlightColor: vehicle['type'] == "danger"
                        ? red.withOpacity(0.5)
                        : vehicle['type'] == "warning"
                            ? brown.withOpacity(0.5)
                            : green.withOpacity(0.5),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      padding: EdgeInsets.fromLTRB(0, 5, 20, 5),
                      decoration: BoxDecoration(
                          boxShadow: defaultBoxShadow,
                          // border: Border.all(
                          //     color: vehicle['type'] == "danger"
                          //         ? red.withOpacity(0.2)
                          //         : vehicle['type'] == "warning"
                          //             ? brown.withOpacity(0.2)
                          //             : green.withOpacity(0.2)),
                          color: black2,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 12, 12, 12),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: vehicle['type'] == "danger"
                                    ? red
                                    : vehicle['type'] == "warning"
                                        ? brown
                                        : green,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              vehicle['type'] == "danger"
                                  ? Icons.dangerous
                                  : vehicle['type'] == "warning"
                                      ? Icons.warning
                                      : Icons.health_and_safety,
                              size: 24,
                              color: white,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vehicle['type'],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: vehicle['type'] == "danger"
                                        ? red
                                        : vehicle['type'] == "warning"
                                            ? brown
                                            : green),
                              ),
                              SizedBox(height: 8),
                              Text(
                                vehicle['message'],
                                style: TextStyle(color: white, fontSize: 14),
                              ),
                              SizedBox(height: 5),
                              Text(date + " jam yang lalu",
                                  style: TextStyle(color: grey, fontSize: 16)),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.chevron_right, color: white)
                        ],
                      ),
                    ),
                  ),
                );
              });
        }
        return Center(child: SpinKitThreeBounce(color: gold));
      }),
    );
  }

  Shimmer _loading() {
    return Shimmer.fromColors(
      highlightColor: white,
      baseColor: grey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: EdgeInsets.fromLTRB(0, 5, 20, 5),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            Shimmer.fromColors(
              highlightColor: white,
              baseColor: grey,
              child: Container(
                margin: EdgeInsets.all(12),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(4)),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  highlightColor: white,
                  baseColor: grey,
                  child: Container(
                    height: 20,
                    width: 180,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(2)),
                  ),
                ),
                SizedBox(height: 5),
                Shimmer.fromColors(
                  highlightColor: white,
                  baseColor: grey,
                  child: Container(
                    height: 14,
                    width: 120,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(2)),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
