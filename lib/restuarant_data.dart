// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:path_provider/path_provider.dart';

final List<Map<String, String>> restaurantOptions = [
  {'name': 'MCDonald', 'imagePath': 'assets/restaurant/logo/paengs.png'},
  {'name': 'Jollibee', 'imagePath': 'assets/restaurant/logo/paengs.png'},
  {'name': 'Chowking', 'imagePath': 'assets/restaurant/logo/paengs.png'},
  {'name': 'Pizza Hut', 'imagePath': 'assets/restaurant/logo/paengs.png'},
  {'name': 'KFC', 'imagePath': 'assets/restaurant/logo/paengs.png'},
  {'name': 'Subway', 'imagePath': 'assets/restaurant/logo/paengs.png'},
  {'name': 'Burger King', 'imagePath': 'assets/restaurant/logo/paengs.png'},
];

// To implement get the json data from github hago
// // filename for the data to be saved in app data
// const filename = 'restaurant_data.json';
//
// Future<String> getLocalFilePath(String filename) async {
//   final directory = await getApplicationDocumentsDirectory();
//   return File('${directory.path}/$filename').path;
// }
//
// Future<void> saveJsonToFile(Map<String, dynamic> jsonData, String filename) async {
//   final filePath = await getLocalFilePath(filename);
//   final file = File(filePath);
//   await file.writeAsString(json.encode(jsonData));
// }
//
// Future<Map<String, dynamic>> readJsonFromFile(String filename) async {
//   final filePath = await getLocalFilePath(filename);
//   final file = File(filePath);
//   if (await file.exists()) {
//     final contents = await file.readAsString();
//     return json.decode(contents);
//   } else {
//     throw Exception('File not found: $filePath');
//   }
// }
//
// void main() async {
//
//   try {
//     final jsonData = await readJsonFromFile(filename);
//     // Use the JSON data as needed.
//     if (kDebugMode) {
//       print('JSON data loaded from $filename');
//     }
//     if (kDebugMode) {
//       print('Data: $jsonData');
//     }
//   } catch (e) {
//     if (kDebugMode) {
//       print('Error: $e');
//     }
//   }
// }
