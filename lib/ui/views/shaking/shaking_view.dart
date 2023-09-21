import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'shaking_viewmodel.dart';

class ShakingView extends StackedView<ShakingViewModel> {
  const ShakingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ShakingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: Center(
      child: Image.asset('assets/Shake1.png'),
    ));
  }

  @override
  ShakingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShakingViewModel();
}
