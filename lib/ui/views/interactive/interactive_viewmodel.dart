import 'package:flutter/foundation.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:food_frenzy/app/app.locator.dart';

class InteractiveViewModel extends BaseViewModel {
  Future<bool> backPress() async {
    return false;
  }
  final _navigationService = locator<NavigationService>();
  Future runStartupLogic() async {
    bool? isFirstLaunch;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstLaunch = prefs.getBool('isFirstLaunch');
    if (isFirstLaunch == null) {
      if (kDebugMode) print("First launch");
      _navigationService.replaceWithOnboardingView();
      await prefs.setBool('isFirstLaunch', false); // set first launch to false
    }
  }
  void toHomeView() {
    _navigationService.navigateToHomeView();
  }
  void toShareView() {
    _navigationService.navigateToShareView();
  }
}
