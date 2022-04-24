import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpsapp/app/modules/home/controllers/notification_controller.dart';
import 'package:gpsapp/app/styles/colors.dart';
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
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 50),
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
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  padding: EdgeInsets.fromLTRB(0, 5, 20, 5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: vehicle['type'] == "danger"
                              ? red.withOpacity(0.2)
                              : vehicle['type'] == "warning"
                                  ? brown.withOpacity(0.2)
                                  : green.withOpacity(0.2)),
                      color: black2,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(12),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: vehicle['type'] == "danger"
                                ? red.withOpacity(0.2)
                                : vehicle['type'] == "warning"
                                    ? brown.withOpacity(0.2)
                                    : green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          vehicle['type'] == "danger"
                              ? Icons.dangerous
                              : vehicle['type'] == "warning"
                                  ? Icons.warning
                                  : Icons.health_and_safety,
                          size: 18,
                          color: white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vehicle['message'],
                            style: TextStyle(color: white, fontSize: 20),
                          ),
                          SizedBox(height: 5),
                          Text(date + " jam yang lalu",
                              style: TextStyle(color: grey, fontSize: 14)),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right, color: white)
                    ],
                  ),
                );
              });
        }
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}
