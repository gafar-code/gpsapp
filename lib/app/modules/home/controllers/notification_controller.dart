import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference vehicle = firestore.collection('vehicle');
    return vehicle.get();
  }

  Stream<QuerySnapshot<Object?>> getRealtime() {
    CollectionReference notification = firestore.collection('notifications');
    return notification.snapshots();
  }
}
