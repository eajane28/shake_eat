import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:shake/shake.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:food_frenzy/restaurant_data.dart';

import '../../../app/app.locator.dart';

class ShakingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  late ShakeDetector _detector;
  bool _isShaking = false;
  final int _maxShake = 3;
  int _shakeCount = 0; // Initialize a variable to count shakes

  bool get isShaking => _isShaking;
  int get shakeCount => _shakeCount; // Getter for shake count

  Future<bool> backPress() async {
    _navigationService.navigateToHomeView();
    return false;
  }

  ShakingViewModel() {
    _detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        generateRandomRestaurant();
        _isShaking = true;
        _shakeCount++; // Increment shake count
        if (kDebugMode) {
          print(
              "Shaking. ShakeCount: $_shakeCount, MaxShake: $_maxShake"); // Print the shake count
        }
        if (shakeCount > _maxShake) {
          _detector.stopListening();
          _shakeCount = 0;
          _navigationService.navigateToAfterShakeView();
        }
      },
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _detector.stopListening();
    super.dispose();
  }
}
