import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/app.locator.dart';

class AfterShakeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final List<Map<String, String>> restaurantOptions = [
    {'name': 'MCDonald', 'imagePath': 'assets/restaurant/logo/paengs.png'},
    {'name': 'Jollibee', 'imagePath': 'assets/restaurant/logo/paengs.png'},
    {'name': 'Chowking', 'imagePath': 'assets/restaurant/logo/paengs.png'},
    {'name': 'Pizza Hut', 'imagePath': 'assets/restaurant/logo/paengs.png'},
    {'name': 'KFC', 'imagePath': 'assets/restaurant/logo/paengs.png'},
    {'name': 'Subway', 'imagePath': 'assets/restaurant/logo/paengs.png'},
    {'name': 'Burger King', 'imagePath': 'assets/restaurant/logo/paengs.png'},
  ];

  Map<String, String> getRandomRestaurant() {
    final random = Random();
    return restaurantOptions[random.nextInt(restaurantOptions.length)];
  }

  // back button behaviour
  Future<bool> backPress() async {
    _navigationService.navigateToHomeView();
    return false;
  }

  void navigateToShaking() {
    _navigationService.navigateToShakeTimerView();
    Timer(const Duration(seconds: 3), () {
      _navigationService.navigateToShakingView();
      Timer(const Duration(seconds: 3), () {
        _navigationService.navigateToAfterShakeView();
      });
    });
  }

  void navigateToDetails() {
    _navigationService.navigateToDetailsView();
  }

  void openMapWithDirections(String mapId) async {
    if (kDebugMode) {
      print("Creating variable for map");
    }
    Uri map = Uri.https('maps.app.goo.gl', '/$mapId', {});
    if (kDebugMode) {
      print("Map created");
      print(map);
      print("Launching map");
    }
    launchUrl(map);
    // if (await canLaunchUrl(map)) {
    //   await launchUrl(map);
    // } else {
    //   throw 'Could not launch';
    // }
  }
}
