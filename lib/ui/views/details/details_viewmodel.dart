import 'package:stacked/stacked.dart';

import '../../../model/details_data.dart';

class DetailsViewModel extends BaseViewModel {
  List detailsList = [
    const DetailsData(
      image: 'assets/photo1.png',
    ),
    const DetailsData(
      image: 'assets/photo2.png',
    )
  ];
}
