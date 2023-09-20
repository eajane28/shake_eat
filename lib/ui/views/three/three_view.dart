import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'three_viewmodel.dart';

class ThreeView extends StackedView<ThreeViewModel> {
  const ThreeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ThreeViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      body: Center(
        child: Text('3',
            style: TextStyle(
              color: Color(0xFFDA1D1D),
              fontSize: 150,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }

  @override
  ThreeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ThreeViewModel();
}
