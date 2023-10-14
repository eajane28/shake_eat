import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dart:async';

import '../../../app/app.locator.dart';

class RedeemViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int _timerDuration = 10;
  late Timer _timer;

  int get timerDuration => _timerDuration;

  RedeemViewModel() {
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerDuration > 1) {
        _timerDuration--;
        notifyListeners();
      } else {
        _timer.cancel();
      }
    });
  }

  void claimedVoucher() {
    _navigationService.navigateToRedeemSuccesView();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
