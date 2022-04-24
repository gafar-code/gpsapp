import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class VehicleController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

// get data sekali
  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference vehicles = firestore.collection('vehicle');
    return vehicles.get();
  }

// get data realtime
  Stream<QuerySnapshot<Object?>> getRealtime() {
    CollectionReference vehicles = firestore.collection('vehicle');
    return vehicles.snapshots();
  }
}
