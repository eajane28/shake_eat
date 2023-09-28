import 'package:food_frenzy/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:food_frenzy/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:food_frenzy/ui/views/home/home_view.dart';
import 'package:food_frenzy/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:food_frenzy/ui/views/interactive/interactive_view.dart';
import 'package:food_frenzy/ui/views/three/three_view.dart';
import 'package:food_frenzy/ui/views/two/two_view.dart';
import 'package:food_frenzy/ui/views/one/one_view.dart';
import 'package:food_frenzy/ui/views/shaking/shaking_view.dart';
import 'package:food_frenzy/ui/views/share/share_view.dart';
import 'package:food_frenzy/ui/views/after_shake/after_shake_view.dart';
import 'package:food_frenzy/ui/views/details/details_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: InteractiveView),
    MaterialRoute(page: ThreeView),
    MaterialRoute(page: TwoView),
    MaterialRoute(page: OneView),
    MaterialRoute(page: ShakingView),
    MaterialRoute(page: ShareView),
    MaterialRoute(page: AfterShakeView),
    MaterialRoute(page: AfterShakeView),
    MaterialRoute(page: DetailsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
