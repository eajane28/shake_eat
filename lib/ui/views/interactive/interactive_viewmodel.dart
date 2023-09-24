import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class InteractiveViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void toHomeView() {
    _navigationService.navigateToHomeView();
  }

  void toShareView() {
    _navigationService.navigateToShareView();
  }
}
