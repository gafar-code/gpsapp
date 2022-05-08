import 'package:get/get.dart';
import 'package:gpsapp/app/controllers/vehicle_controller.dart';
import 'package:gpsapp/app/modules/maps/controllers/pageview_controller.dart';

import '../controllers/maps_controller.dart';

class MapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapsController>(() => MapsController());
    Get.lazyPut<PageViewController>(() => PageViewController());
    Get.lazyPut<VehicleController>(() => VehicleController());
  }
}
