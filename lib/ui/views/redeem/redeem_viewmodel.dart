import 'package:stacked/stacked.dart';
import 'dart:async';

class RedeemViewModel extends BaseViewModel {
  int _timerDuration = 10;
  late Timer _timer;

  int get timerDuration => _timerDuration;

  RedeemViewModel() {
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timerDuration > 0) {
        _timerDuration--;
        notifyListeners();
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
