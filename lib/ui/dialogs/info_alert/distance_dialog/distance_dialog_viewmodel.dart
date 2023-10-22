import 'package:stacked/stacked.dart';

class DistanceDialogViewModel extends BaseViewModel {
  double sliderValue = 1;

  void updateSliderValue(double newValue) {
    sliderValue = newValue;
    notifyListeners();
  }

  String getDistanceLabel(double maxSlider) {
    String distanceLabel = 'Near'; // Default label

    if (sliderValue <= maxSlider / 3) {
      distanceLabel = 'walking';
    } else if (sliderValue <= (maxSlider / 3) * 2) {
      distanceLabel = 'Moderate';
    } else {
      distanceLabel = 'Far';
    }

    return distanceLabel;
  }
}
