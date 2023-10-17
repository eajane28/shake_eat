import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:stacked/stacked.dart';
import '../../common/svg_icons_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:food_frenzy/constants.dart';

import 'interactive_viewmodel.dart';

class InteractiveView extends StackedView<InteractiveViewModel> {
  const InteractiveView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InteractiveViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () => viewModel.backPress(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset('assets/icon/shake_it.png',
                    height: 250, width: 250),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Share.share(Constant.sharemsg);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFBAB10).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Center(
                              child: Stack(children: [
                                Icon(Icons.share,
                                    color: Color(0xFFFBAB10), size: 40),
                              ]),
                            ),
                          ),
                          const Text('SHARE',
                              style: TextStyle(
                                  color: Color(0xFFDA1D1D),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(
                          color: Color(0xFFDA1D1D),
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: viewModel.toHomeView,
                      child: Column(children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFBAB10).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Stack(
                              children: [
                                SvgPicture.asset(SvgIcons.dine,
                                    height: 40, width: 40)
                              ],
                            ),
                          ),
                        ),
                        const Text('DINE',
                            style: TextStyle(
                                color: Color(0xFFDA1D1D),
                                fontWeight: FontWeight.bold)),
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  InteractiveViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InteractiveViewModel();
  void onViewModelReady(InteractiveViewModel viewModel) => viewModel.runStartupLogic();
}
