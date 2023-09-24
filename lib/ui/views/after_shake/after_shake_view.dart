import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'after_shake_viewmodel.dart';

class AfterShakeView extends StackedView<AfterShakeViewModel> {
  const AfterShakeView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      AfterShakeViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 405,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDA1D1D),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                      bottomLeft: Radius.circular(150.0),
                      bottomRight: Radius.circular(150.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 225.0, left: 50.0, right: 50.0),
                  child: Image.asset('assets/paengs.png', height: 289, width: 400),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: GestureDetector(
                  onTap: viewModel.navigateToShaking,
                  child: Container(
                    width: 137.0,
                    height: 39.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDA1D1D),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Reshake',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  @override
  AfterShakeViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      AfterShakeViewModel();
}
