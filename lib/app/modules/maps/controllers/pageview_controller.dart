import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpsapp/app/controllers/vehicle_controller.dart';

class PageViewController extends GetxController {
  var currentIndex = 0.obs;
  var pageController = PageController().obs;
  final _vehicleC = Get.put(VehicleController());
  void pageChange(int value) {
    // merubah currentVehicle saat berpindah halaman
    _vehicleC.chooseVehicle(value);
    currentIndex.value = value;
  }

  void nextPage() {
    if (currentIndex.value < _vehicleC.listOfVehicle.length - 1) {
      pageController.value.animateToPage(currentIndex.value + 1,
          duration: Duration(milliseconds: 800), curve: Curves.fastOutSlowIn);
      currentIndex.value++;
    }
    return;
  }

  void previewsPage() {
    if (currentIndex.value != 0) {
      pageController.value.animateToPage(currentIndex.value - 1,
          duration: Duration(milliseconds: 800), curve: Curves.fastOutSlowIn);
      currentIndex.value--;
    }
    return;
  }

  @override
  void onClose() {
    _vehicleC.dispose();
  }
}
