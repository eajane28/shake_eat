import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ShareViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void toInteractiveView() {
    _navigationService.navigateToInteractiveView();
  }
}
