import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:stacked/stacked.dart';
import '../../common/svg_icons_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'interactive_viewmodel.dart';

class InteractiveView extends StackedView<InteractiveViewModel> {
  const InteractiveView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InteractiveViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image.asset('assets/Shake it - Logo.png',
                  height: 250, width: 250),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      const String appLink =
                          "https://github.com/eajane28/shake_eat/releases";
                      const String message =
                          "Checkout this awesome app for choosing where to eat randomly!\n$appLink";
                      Share.share(message);
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
                                color: Color(0xFFFBAB10),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
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
                              color: Color(0xFFFBAB10),
                              fontWeight: FontWeight.bold)),
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  InteractiveViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InteractiveViewModel();
}
