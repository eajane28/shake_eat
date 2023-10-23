import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> labelDiet = ["any", "beef", "chicken", "pork", "vegetables"];
List<bool> cbDiet = [false, false, false, false, false];
double pricePref = 150;
double distancePref = 2;
Future<void> loadPreferenceValues() async {
  final prefs = await SharedPreferences.getInstance();
  pricePref = prefs.getDouble('Price_preference') ?? 150;
  distancePref = prefs.getDouble('Distance_preference') ?? 2;
  for (int i = 0; i < labelDiet.length; i++) {
    cbDiet[i] = prefs.getBool('checkbox_$i') ?? true;
    if(kDebugMode) print('checkbox_$i: $cbDiet[i]');
  }
}











