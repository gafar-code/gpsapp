import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpsapp/app/models/vehicle.dart';

class VehicleController extends GetxController {
  RxList<Vehicle> listOfVehicle = [
    Vehicle("Vario", "S275MZ", 75, LatLng(-7.472613, 112.667542), "jalan"),
    Vehicle("Berio", "S275MZ", 75, LatLng(-7.472613, 112.667542), "berhenti"),
    Vehicle("Vario", "S275MZ", 75, LatLng(-7.472613, 112.667542), "jalan"),
  ].obs;
  var currentVehicle =
      Vehicle("Vario", "S275MZ", 75, LatLng(-7.472613, 112.667542), "jalan")
          .obs;

  void getAllVehicle() {
    // selalu di pantau setiap ada perubahan data pada database
  }

  void chooseVehicle(int index) {
    // memilih vehicle
    currentVehicle.value = listOfVehicle[index];
  }

  ///////////////////////////////////////////////////////////////////////////////
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
  ///////////////////////////////////////////////////////////////////////////////
}
