import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpsapp/app/styles/colors.dart';

import '../controllers/maps_controller.dart';
import 'listvehicles.dart';
import 'stats.dart';

class MapsView extends GetView<MapsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(children: [
        Obx(
          // google map
          () => GoogleMap(
            padding: EdgeInsets.symmetric(vertical: 120),
            markers: controller.markers,
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            initialCameraPosition: controller.initialPosition.value,
            onMapCreated: (GoogleMapController value) {
              controller.onMapCreated(value);
            },
          ),
        ),
        Obx(
            // jika map belum di buat akan menampilkan circularprogres
            () => !controller.isLoaded.value
                ? Container(
                    color: black,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Stack(
                      children: [
                        SpinKitRipple(
                          borderWidth: 15,
                          color: gold,
                          size: 200,
                        ),
                        SpinKitDoubleBounce(
                          color: gold,
                        ),
                      ],
                    )))
                : Center()),
        StatsBar(),
        ListVehicle()
      ]),
    );
  }
}
