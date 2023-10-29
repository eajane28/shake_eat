import 'package:food_frenzy/app/app.router.dart';
import 'package:food_frenzy/restaurant_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/details_data.dart';

class DetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List detailsList = [];

  DetailsViewModel() {
    for (String menuImage in theChosenRestaurant?['menu']) {
      detailsList.add(
        DetailsData(
          image: menuImage,
        ),
      );
    }
  }

  void navigateToRedeem() {
    _navigationService.navigateToNoVouchersView();
  }

  void navigateToAfterShake() {
    _navigationService.navigateToAfterShakeView();
  }
}
