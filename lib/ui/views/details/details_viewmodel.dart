import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/details_data.dart';

class DetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  List detailsList = [
    const DetailsData(
      image: 'assets/restaurant/product/paeng/1.png',
    ),
    const DetailsData(
      image: 'assets/restaurant/product/paeng/2.png',
    )
  ];
  void navigateToRedeem() {
    _navigationService.navigateToNoVouchersView();
  }
}
