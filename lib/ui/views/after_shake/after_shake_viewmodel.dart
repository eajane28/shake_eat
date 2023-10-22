import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:food_frenzy/restuarant.dart';

import '../../../app/app.locator.dart';

class AfterShakeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();


  Map<String, String> getRandomRestaurant() {
    final random = Random();
    print(random);
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
