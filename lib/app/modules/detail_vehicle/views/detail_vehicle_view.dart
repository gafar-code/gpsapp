import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpsapp/app/modules/detail_vehicle/views/headerwidget.dart';
import 'package:gpsapp/app/modules/maps/controllers/maps_controller.dart';
import 'package:gpsapp/app/styles/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/detail_vehicle_controller.dart';

class DetailVehicleView extends GetView<DetailVehicleController> {
  @override
  Widget build(BuildContext context) {
    final _mapC = Get.find<MapsController>();
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Scaffold(
        backgroundColor: black2,
        body: Stack(
          children: [
            SlidingUpPanel(
              panel: Center(
                child: Text("This is the sliding Widget"),
              ),
              collapsed: Container(
                decoration:
                    BoxDecoration(color: Colors.blueGrey, borderRadius: radius),
                child: Center(
                  child: Text(
                    "This is the collapsed Widget",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              body: GoogleMap(
                padding: EdgeInsets.symmetric(vertical: 120),
                mapType: MapType.normal,
                zoomControlsEnabled: false,
                initialCameraPosition: _mapC.initialPosition.value,
                onMapCreated: (GoogleMapController value) {
                  _mapC.onMapCreated(value);
                },
              ),
              borderRadius: radius,
            ),
            HeaderWidget(),
          ],
        ));
  }
}
