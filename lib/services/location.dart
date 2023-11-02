import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:food_frenzy/util/toast.dart';
import 'package:food_frenzy/restaurant_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
const String googleApiKey = 'AIzaSyC3pQJHvd6SlGgxtNmzYTzJmjWUZqOS6j8&fbclid=IwAR3JhnkKXRv596gsdL0rECPVmY6ym0qlzKJ_EfMhjU8Obsfw1v9l-QQ32dE';


/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Position ?currentLocation;

String destinationDistance = '';
String timeWalk = '';
String timeDrive = '';

void calculateChosenRestaurantDistance(double lat, double long) {
  if (kDebugMode) {
    print('checking restaurant travel info');
    print('current location: $currentLocation');
    print('restaurant loc: $lat, $long');
  }

  if(currentLocation != null) {
    distanceBetween = calculateDistance(currentLocation!, lat, long);
    getTravelInfo(googleApiKey, currentLocation!.latitude, currentLocation!.longitude, lat, long);
  }
}



Future<void> updateCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    showToastMessage('Please enable location service', 5);
    return;
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
      return;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    showToastMessage('Grant the location in the settings', 5);
    return;
  }
  Position? prevLoc = currentLocation;
  Position curloc = await Geolocator.getCurrentPosition();
  currentLocation = curloc;
  if(currentLocation != null && prevLoc == null) {
      generateRestaurantDistance();
  }
  else if(currentLocation != null && prevLoc != null ){
    if(distanceBetweenPosition(currentLocation!, prevLoc) > 0.2) generateRestaurantDistance();
  }

  if (kDebugMode) print('current location: $currentLocation');
}

  double distanceBetweenPosition(Position currentLoc, Position prevLoc){
    const double radius = 6371.0; // Earth's radius in kilometers

    // Convert latitude and longitude from degrees to radians
    final double fromLatRad = currentLoc.latitude * (pi / 180);
    final double fromLonRad = currentLoc.longitude * (pi / 180);
    final double toLatRad = prevLoc.latitude * (pi / 180);
    final double toLonRad = prevLoc.longitude * (pi / 180);

    // Calculate the differences
    final double latDiff = toLatRad - fromLatRad;
    final double lonDiff = toLonRad - fromLonRad;

    // Haversine formula
    final double a = pow(sin(latDiff / 2), 2) +
        cos(fromLatRad) * cos(toLatRad) * pow(sin(lonDiff / 2), 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Calculate the distance
    final double distance = radius * c;
    if (kDebugMode) {
      print(distance);
    }
    return distance;
  }
// calculate the distance between to Haversine formula
double calculateDistance(Position currentLoc, double toLat, double toLong) {
  const double radius = 6371.0; // Earth's radius in kilometers

  // Convert latitude and longitude from degrees to radians
  final double fromLatRad = currentLoc.latitude * (pi / 180);
  final double fromLonRad = currentLoc.longitude * (pi / 180);
  final double toLatRad = toLat * (pi / 180);
  final double toLonRad = toLong * (pi / 180);

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
  Timer.periodic(const Duration(seconds: 10), (Timer timer) {
    updateCurrentLocation();
  });
}


// Get the distance between two origin using google api
Future<void> getTravelInfo(String apiKey, double originLat, double originLng, double destinationLat, double destinationLng) async {
  updateCurrentLocation();
  timeDrive = '';
  timeWalk = '';
  destinationDistance = '';
  Uri drivingUri = Uri.parse('https://maps.googleapis.com/maps/api/directions/json?'
      'origin=$originLat,$originLng&'
      'destination=$destinationLat,$destinationLng&'
      'mode=driving&key=$apiKey');

  Uri walkingUri = Uri.parse('https://maps.googleapis.com/maps/api/directions/json?'
      'origin=$originLat,$originLng&'
      'destination=$destinationLat,$destinationLng&'
      'mode=walking&key=$apiKey');

  final drivingResponse = await http.get(drivingUri);
  final walkingResponse = await http.get(walkingUri);

  if (drivingResponse.statusCode == 200 && walkingResponse.statusCode == 200) {
    final drivingData = json.decode(drivingResponse.body);
    final walkingData = json.decode(walkingResponse.body);

    if (drivingData['status'] == 'OK' && walkingData['status'] == 'OK') {
      timeDrive = drivingData['routes'][0]['legs'][0]['duration']['text'];
      timeWalk = walkingData['routes'][0]['legs'][0]['duration']['text'];
      destinationDistance = drivingData['routes'][0]['legs'][0]['distance']['text'];

      if (kDebugMode) {
        print('Distance: $destinationDistance');
        print('Driving Duration: $timeDrive');
        print('Walking Duration: $timeWalk');
      }
      return;
    } else {
      timeDrive = '';
      timeWalk = '';
      destinationDistance = '';
      if (kDebugMode) {
        print('Error in the response data');
      }
    }
  } else {
    if (kDebugMode) {
      print('Error in the HTTP request');
    }
  }
}