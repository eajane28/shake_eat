// Import necessary Flutter packages
import 'package:flutter/material.dart';

// Import custom modules and services
import 'package:food_frenzy/app/app.bottomsheets.dart';
import 'package:food_frenzy/app/app.dialogs.dart';
import 'package:food_frenzy/app/app.locator.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'persistent_data.dart';

// Entry point for the Flutter application
Future<void> main() async {
  // Ensure that Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the service locator (dependency injection)
  await setupLocator();

  PersistentData.geData();
  // Setup the UI for dialogs
  setupDialogUi();

  // Setup the UI for bottom sheets
  setupBottomSheetUi();

  // Run the Flutter application
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
      initialRoute: Routes.startupView,

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
