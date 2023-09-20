import 'dart:async';

import 'package:food_frenzy/app/app.dialogs.dart';
import 'package:food_frenzy/app/app.locator.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  void showPriceRange() async {
    await _dialogService.showCustomDialog(
      title: "Select price range",
      variant: DialogType.PriceDialogUi,
      description: "",
    );
  }

  void showDietRange() async {
    await _dialogService.showCustomDialog(
      title: "Select dietary preference",
      variant: DialogType.DietDialogUi,
      description: "",
    );
  }

  void showDistanceRange() async {
    await _dialogService.showCustomDialog(
      title: "Select distance",
      variant: DialogType.DistanceDialogUi,
      description: "",
    );
  }

  void navigateToShaking() {
    _navigationService.navigateToThreeView();
    Timer(const Duration(seconds: 1), () {
      _navigationService.navigateToTwoView();
      Timer(const Duration(seconds: 1), () {
        _navigationService.navigateToOneView();
        Timer(const Duration(seconds: 1), () {
          _navigationService.navigateToShakingView();
        });
      });
    });
  }
}
