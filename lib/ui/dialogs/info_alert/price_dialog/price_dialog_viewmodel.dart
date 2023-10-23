import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:food_frenzy/services/sharedprefs.dart';

class PriceDialogViewModel extends BaseViewModel {
  double sliderValue = pricePref;

  void updateSliderValue(double newValue) {
    sliderValue = newValue;
    pricePref = newValue;
    notifyListeners();
    savePriceValue();
  }

  String getPriceLabel(double maxSlider) {
    String priceLabel = 'Affordable'; // Default label

    if (sliderValue <= 100) {
      priceLabel = 'affordable';
    } else if (sliderValue > 100 && sliderValue <= 300) {
      priceLabel = 'medium';
    } else {
      priceLabel = 'expensive';
    }
    return priceLabel;
  }

  Future<void> savePriceValue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('Price_preference', sliderValue);
  }
}
