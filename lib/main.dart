
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_frenzy/app/app.bottomsheets.dart';
import 'package:food_frenzy/app/app.dialogs.dart';
import 'package:food_frenzy/app/app.locator.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'util/toast.dart';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final locationStatus = await Permission.location.status;
  if (!locationStatus.isGranted) {
    if (kDebugMode) print("Location denied");
    showToastMessage("Please grant location permission", 3);
    Permission.location.request();
  } else {
    if(kDebugMode) print("location granted");
  }
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform);
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
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