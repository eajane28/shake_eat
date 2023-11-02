import 'package:flutter/material.dart';
import 'package:food_frenzy/app/app.bottomsheets.dart';
import 'package:food_frenzy/app/app.dialogs.dart';
import 'package:food_frenzy/app/app.locator.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:food_frenzy/services/location.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  updateCurrentLocation();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  updateLocationEvery10sec();
  runApp(const MainApp());
}

// Main application widget
class MainApp extends StatelessWidget {
  // Constructor for the MainApp widget
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Specify the initial route for the application
      initialRoute: Routes.interactiveView,

      // Define a callback to generate routes using StackedRouter
      onGenerateRoute: StackedRouter().onGenerateRoute,

      // Provide a navigator key for Stacked services
      navigatorKey: StackedService.navigatorKey,

      // Register Stacked's route observer for navigation events
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}