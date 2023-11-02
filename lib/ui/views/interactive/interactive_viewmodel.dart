import 'package:flutter/foundation.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:food_frenzy/app/app.locator.dart';
import 'package:food_frenzy/restaurant_data.dart';

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
    generatePreferredRestaurant();
  }

  Future<void> toHomeView() async {
    _navigationService.navigateToHomeView();
    //updateCurrentLocation();
  }
  void toShareView() {
    _navigationService.navigateToShareView();
  }
}