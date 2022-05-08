import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpsapp/app/styles/map.dart';

class MapsController extends GetxController {
  late GoogleMapController _controller;
  var isLoaded = false.obs;
  var initialPosition = CameraPosition(
    target: LatLng(-7.472613, 112.667542),
  ).obs;
  var vehiclePosition = CameraPosition(
          target: LatLng(-7.472613, 112.667542),
          tilt: 59.440717697143555,
          zoom: 14)
      .obs;

  Future<void> onMapCreated(GoogleMapController value) async {
    //  fungsi dipanggil saat map telah dibuat
    _controller = value;
    _controller.setMapStyle(mapStyle);
    await Future.delayed(Duration(seconds: 2));
    isLoaded.value = true;
    _controller
        .animateCamera(CameraUpdate.newCameraPosition(vehiclePosition.value));
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    _controller.dispose();
  }
}
