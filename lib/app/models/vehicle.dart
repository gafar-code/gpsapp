import 'package:google_maps_flutter/google_maps_flutter.dart';

class Vehicle {
  String id;
  String name;
  String platNumb;
  int battery;
  LatLng location;
  String stats;
  Vehicle(this.id, this.name, this.platNumb, this.battery, this.location,
      this.stats);
}
