import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpsapp/app/controllers/vehicle_controller.dart';
import 'package:gpsapp/app/modules/maps/controllers/maps_controller.dart';

class PageViewController extends GetxController {
  var currentIndex = 0.obs;
  var pageController = PageController().obs;
  final _vehicleC = Get.find<VehicleController>();
  final _mapsC = Get.find<MapsController>();
  void pageChange(int value) {
    _vehicleC
        .chooseVehicle(value); // merubah currentVehicle saat berpindah halaman
    currentIndex.value = value;
  }

  void nextPage() {
    if (currentIndex.value < _vehicleC.listOfVehicle.length - 1) {
      pageController.value.animateToPage(currentIndex.value + 1,
          duration: Duration(milliseconds: 800), curve: Curves.fastOutSlowIn);
      _vehicleC
          .chooseVehicle(currentIndex.value + 1); // merubah kendaraan terpilih
      currentIndex.value++;
      _mapsC
          .zoomToCurrentVehicle(); // melakukan zoom ke kendaraan yang terpilih
    }
    return;
  }

  void previewsPage() {
    if (currentIndex.value != 0) {
      pageController.value.animateToPage(currentIndex.value - 1,
          duration: Duration(milliseconds: 800), curve: Curves.fastOutSlowIn);
      _vehicleC
          .chooseVehicle(currentIndex.value - 1); // merubah kendaraan terpilih
      currentIndex.value--;
      _mapsC
          .zoomToCurrentVehicle(); // melakukan zoom ke kendaraan yang terpilih
    }
    return;
  }

  @override
  void onClose() {
    _mapsC.dispose();
  }
}
