import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:food_frenzy/app/app.locator.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    bool? isFirstLaunch;
    final _navigationService = locator<NavigationService>();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstLaunch = prefs.getBool('isFirstLaunch');
    if (isFirstLaunch == null) {
      _navigationService.replaceWithOnboardingView();
      await prefs.setBool('isFirstLaunch', false); // set first launch to false
    } else {
      _navigationService.replaceWithInteractiveView();
    }
  }
}
