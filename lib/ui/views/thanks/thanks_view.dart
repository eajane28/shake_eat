import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'thanks_viewmodel.dart';

class ThanksView extends StackedView<ThanksViewModel> {
  const ThanksView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ThanksViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 405,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDA1D1D).withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                          bottomLeft: Radius.circular(150.0),
                          bottomRight: Radius.circular(150.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 250.0),
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              'We\'re happy to serve you!',
                              style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFFDA1D1D),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          Center(
                            child: SizedBox(
                              height: 200,
                              child: Image.asset('assets/phone.png',
                                  fit: BoxFit.contain),
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Center(
                            child: Text(
                              'Thank you for shaking!',
                              style: TextStyle(
                                fontSize: 24,
                                color: Color(0xFFFBAB10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }

  @override
  ThanksViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ThanksViewModel();
}
