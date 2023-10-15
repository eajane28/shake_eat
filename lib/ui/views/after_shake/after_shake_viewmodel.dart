import 'dart:async';

import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class AfterShakeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

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
}
