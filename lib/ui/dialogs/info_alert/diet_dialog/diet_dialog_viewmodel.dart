import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:food_frenzy/sharedprefs/value_init.dart';

class DietDialogViewModel extends BaseViewModel {
  List<String> labels = ["any", "beef", "chicken", "pork", "vegetables"];
  List<bool> checkBoxValues = cbDiet;

  DietDialogViewModel() {
    loadCheckBoxValues();
  }

  void updateCheckBoxValue(int index, bool newValue) {

    if(index == 0){
      for(int i=0; i < labels.length; i++){
          checkBoxValues[i] = newValue;
        }
    } else {
      checkBoxValues[index] = newValue;
      checkBoxValues[0] = checkBoxValues.skip(1).every((element) => element == true);
    }
    saveCheckBoxValues();
    notifyListeners();
  }

  // Load checkbox values from SharedPreferences
  Future<void> loadCheckBoxValues() async {
    if(kDebugMode) print("loading value");
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < labels.length; i++) {
      checkBoxValues[i] = prefs.getBool('checkbox_$i') ?? false;
    }
  }

  // Save checkbox values to SharedPreferences
  Future<void> saveCheckBoxValues() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < labels.length; i++) {
      prefs.setBool('checkbox_$i', checkBoxValues[i]);
    }
  }
}
