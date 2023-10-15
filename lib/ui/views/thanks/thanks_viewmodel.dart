import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ThanksViewModel extends BaseViewModel {
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    final _navigationService = locator<NavigationService>();
    _navigationService.replaceWithInteractiveView();
  }
}
