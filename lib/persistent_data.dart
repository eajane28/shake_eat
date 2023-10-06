// This file contains all the persistent data
import 'package:flutter/foundation.dart';
import 'package:food_frenzy/util/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistentData {
  static bool? isFirstLaunch;

  // Obtain shared preferences.
  static Future<void> geData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstLaunch = prefs.getBool('isFirstLaunch');
    if (kDebugMode) {
      print('first launch: ');
      print(isFirstLaunch ?? "true");
    }

    // first launch
    if (isFirstLaunch == null) {
      // todo
      // add a task what to do when it is first launch
      showToastMessage("First Launch");
      await prefs.setBool('isFirstLaunch', false); // set first launch to false
    }else {
      showToastMessage("Not first launch");
    }
  }
}