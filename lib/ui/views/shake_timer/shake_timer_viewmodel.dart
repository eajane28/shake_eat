import 'package:flutter/foundation.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'dart:async';

import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ShakeTimerViewModel extends BaseViewModel {
  int _timerDuration = 3;
  late Timer _timer;
  final _navigationService = locator<NavigationService>();

  int get timerDuration => _timerDuration;
  Future<bool> backPress() async {
    _navigationService.navigateToHomeView();
    _timer.cancel();
    _timerDuration = 3;
    return false;
  }

  ShakeTimerViewModel() {
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerDuration > 1) {
        _timerDuration--;
        if (kDebugMode) print("Countdown: $_timerDuration");
        notifyListeners();
      } else {
        _timer.cancel();
        _navigationService.navigateToShakingView();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
