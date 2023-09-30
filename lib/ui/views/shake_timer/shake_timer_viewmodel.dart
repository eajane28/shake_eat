import 'package:stacked/stacked.dart';
import 'dart:async';

class ShakeTimerViewModel extends BaseViewModel {
  int _timerDuration = 3;
  late Timer _timer;

  int get timerDuration => _timerDuration;

  ShakeTimerViewModel() {
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

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
