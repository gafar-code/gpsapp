import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpsapp/app/controllers/vehicle_controller.dart';
import 'package:gpsapp/app/styles/map.dart';

class MapsController extends GetxController {
  late GoogleMapController _controller;
  final _vehicleC = Get.find<VehicleController>();
  var markers = <Marker>{}.obs;
  var isLoaded = false.obs;
  var initialPosition = CameraPosition(
          target: LatLng(-7.472613, 112.667542),
          tilt: 59.440717697143555,
          zoom: 14)
      .obs;

  Future<void> onMapCreated(GoogleMapController value) async {
    //  fungsi dipanggil saat map telah dibuat
    _controller = value;
    _controller.setMapStyle(mapStyle);
    addMarker();
    await Future.delayed(Duration(seconds: 2));
    isLoaded.value = true;
    update();
  }

  void zoomToCurrentVehicle() {
    //  fungsi camera zoom
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: _vehicleC.currentVehicle.value.location,
        tilt: 59.440717697143555,
        zoom: 14)));
  }

  void addMarker() {
    markers.clear();
    for (int i = markers.length; i < _vehicleC.listOfVehicle.length; i++) {
      markers.add(Marker(
        markerId: MarkerId(_vehicleC.listOfVehicle[i].id),
        position: _vehicleC.listOfVehicle[i].location,
        infoWindow: InfoWindow(
          title: 'My Custom Title ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    _controller.dispose();
    _vehicleC.dispose();
  }
}
