import 'package:food_frenzy/app/app.dialogs.dart';
import 'package:food_frenzy/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  void showPriceRange() async {
    await _dialogService.showCustomDialog(
      title: "Select price range",
      variant: DialogType.PriceDialogUi,
      description: "",
    );
  }
}
