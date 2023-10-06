// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import '../ui/dialogs/info_alert/diet_dialog/diet_dialog_ui.dart';
import '../ui/dialogs/info_alert/distance_dialog/distance_dialog_ui.dart';
import '../ui/dialogs/info_alert/price_dialog/price_dialog_ui.dart';
import 'app.locator.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';

enum DialogType {
  infoAlert, PriceDialogUi, DistanceDialogUi, DietDialogUi,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.PriceDialogUi: (context, request, completer) =>
        PriceDialogUi(request: request, completer: completer),
    DialogType.DietDialogUi: (context, request, completer) =>
        DietDialogUi(request: request, completer: completer),
    DialogType.DistanceDialogUi: (context, request, completer) =>
        DistanceDialogUi(request: request, completer: completer),

  };

  dialogService.registerCustomDialogBuilders(builders);
}