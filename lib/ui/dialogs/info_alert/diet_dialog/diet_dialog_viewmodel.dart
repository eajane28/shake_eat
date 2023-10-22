import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class DietDialogViewModel extends BaseViewModel {
  List<String> labels = ["any", "beef", "chicken", "pork", "vegetables"];
  List<bool> checkBoxValues = [false, false, false, false, false];

  DietDialogViewModel() {
    loadCheckBoxValues();
  }

  void updateCheckBoxValue(int index, bool newValue) {
    checkBoxValues[index] = newValue;
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

  // Method to trigger the dialog display
  void showDietDialog() {
    // Trigger the dialog display using your dialog service
  }
}
