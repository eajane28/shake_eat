import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:food_frenzy/app/app.locator.dart';
import 'package:food_frenzy/util/toast.dart';

class InteractiveViewModel extends BaseViewModel {
  Object? get isFirstLaunch => null;

  Future<bool> backPress() async {
    return false;
  }
  final _navigationService = locator<NavigationService>();
  Future runStartupLogic() async {
    bool? isFirstLaunch;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstLaunch = prefs.getBool('isFirstLaunch');
    if (kDebugMode) print("First launch 1 $isFirstLaunch");
    if (isFirstLaunch == null) {
      if (kDebugMode) print("First 2 launch");
      _navigationService.replaceWithOnboardingView();
      await prefs.setBool('isFirstLaunch', false); // set first launch to false
    }
  }

  Future<void> toHomeView() async {
    showToastMessage("Getting location", 10);
    Position currentLocation = await _determinePosition();
    cancelToastMessage();
    _navigationService.navigateToHomeView();
    if(kDebugMode) print(currentLocation);
  }
  void toShareView() {
    _navigationService.navigateToShareView();
  }
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
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
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  Position position = await Geolocator.getCurrentPosition();
  return position;
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