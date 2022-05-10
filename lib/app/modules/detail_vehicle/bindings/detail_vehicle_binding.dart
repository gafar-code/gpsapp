import 'package:get/get.dart';
import 'package:gpsapp/app/modules/maps/controllers/maps_controller.dart';

import '../controllers/detail_vehicle_controller.dart';

class DetailVehicleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailVehicleController>(
      () => DetailVehicleController(),
    );
    Get.lazyPut<MapsController>(
      () => MapsController(),
    );
  }
}
