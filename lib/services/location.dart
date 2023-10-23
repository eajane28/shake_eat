import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:food_frenzy/util/toast.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.

Position ?currentLocation;

Future<void> updateCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    showToastMessage('Please enable location service', 5);
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      showToastMessage('Please grant location permission', 5);
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    showToastMessage('Open the app settings and grant the location', 5);
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  currentLocation = await Geolocator.getCurrentPosition();
  if (kDebugMode) {
    print('current location: $currentLocation');
  }
}

// calculate the distance between to Haversine formula
double calculateDistance(Position from, Position to) {
  const double radius = 6371.0; // Earth's radius in kilometers

  // Convert latitude and longitude from degrees to radians
  final double fromLatRad = from.latitude * (pi / 180);
  final double fromLonRad = from.longitude * (pi / 180);
  final double toLatRad = to.latitude * (pi / 180);
  final double toLonRad = to.longitude * (pi / 180);

  // Calculate the differences
  final double latDiff = toLatRad - fromLatRad;
  final double lonDiff = toLonRad - fromLonRad;

  // Haversine formula
  final double a = pow(sin(latDiff / 2), 2) +
      cos(fromLatRad) * cos(toLatRad) * pow(sin(lonDiff / 2), 2);
  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  // Calculate the distance
  final double distance = radius * c;

  return distance;
}

void updateLocationEvery10sec() {
  Timer.periodic(Duration(seconds: 10), (Timer timer) {
    updateCurrentLocation();
  });
}