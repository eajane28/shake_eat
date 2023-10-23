import 'package:food_frenzy/services/sharedprefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class DistanceDialogViewModel extends BaseViewModel {
  double sliderValue = distancePref;

  void updateSliderValue(double newValue) {
    sliderValue = newValue;
    saveDistanceValue();
    distancePref = newValue;
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
  Future<void> saveDistanceValue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('Distance_preference', sliderValue);
  }
}
