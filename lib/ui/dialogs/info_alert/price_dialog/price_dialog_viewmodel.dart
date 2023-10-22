import 'package:stacked/stacked.dart';

class PriceDialogViewModel extends BaseViewModel {
  double sliderValue = 100;

  void updateSliderValue(double newValue) {
    sliderValue = newValue;
    notifyListeners();
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
}
