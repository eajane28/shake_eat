import 'package:flutter/material.dart';
import 'package:food_frenzy/app/app.locator.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:food_frenzy/model/onboarding_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel {
  var pageController = PageController();
  String buttonText = 'Next';
  final _navigationService = locator<NavigationService>();

  final onBoardingList= [
    const OnboardingData(imagePage: 'assets/onboarding1.png', title: '', message: ''),
    const OnboardingData(imagePage: 'assets/onboarding2.png', title: '', message: ''),
    const OnboardingData(imagePage: 'assets/onboarding3.png', title: '', message: ''),
  ];
  int selectedPosition = 0;

  void onPageChanged(int value) {
    selectedPosition = value;
    changeText();
    rebuildUi();
  }

  void onNexPage() {
    if (selectedPosition < 2) {
      pageController.nextPage(
          curve: Curves.linear, duration: const Duration(milliseconds: 300));
    }
    changeText();
    startPage();
    rebuildUi();
  }

  void changeText() {
    buttonText = selectedPosition < 2 ? 'Next' : "Get Started  >>>";
    rebuildUi();
  }

  void startPage() {
    if (buttonText == "Get Started  >>>" && selectedPosition == 2) {
      _navigationService.navigateToInteractiveView();
    }
  }
}
