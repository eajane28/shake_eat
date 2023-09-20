import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'one_viewmodel.dart';

class OneView extends StackedView<OneViewModel> {
  const OneView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OneViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      body: Center(
        child: Text('1',
            style: TextStyle(
              color: Color(0xFFDA1D1D),
              fontSize: 150,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }

  @override
  OneViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OneViewModel();
}
