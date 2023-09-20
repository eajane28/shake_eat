import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'two_viewmodel.dart';

class TwoView extends StackedView<TwoViewModel> {
  const TwoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TwoViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      body: Center(
        child: Text('2',
            style: TextStyle(
              color: Color(0xFFDA1D1D),
              fontSize: 150,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }

  @override
  TwoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TwoViewModel();
}
