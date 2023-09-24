import 'dart:async';

import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class AfterShakeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToShaking() {
    _navigationService.navigateToThreeView();
    Timer(const Duration(seconds: 1), () {
      _navigationService.navigateToTwoView();
      Timer(const Duration(seconds: 1), () {
        _navigationService.navigateToOneView();
        Timer(const Duration(seconds: 1), () {
          _navigationService.navigateToShakingView();
          Timer(const Duration(seconds: 3), () {
            _navigationService.navigateToAfterShakeView();
          });
        });
      });
    });
  }
}
