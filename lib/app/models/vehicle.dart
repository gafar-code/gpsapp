import 'package:google_maps_flutter/google_maps_flutter.dart';

class Vehicle {
  String name;
  String platNumb;
  int battery;
  LatLng location;
  String stats;
  Vehicle(this.name, this.platNumb, this.battery, this.location, this.stats);
}
