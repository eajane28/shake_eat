import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'shake_timer_viewmodel.dart';

class ShakeTimerView extends StackedView<ShakeTimerViewModel> {
  const ShakeTimerView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      ShakeTimerViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      body: Center(
        child: Text(
          '${viewModel.timerDuration}',
          style: const TextStyle(
            fontSize: 150,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  @override
  ShakeTimerViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      ShakeTimerViewModel();
}
