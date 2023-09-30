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
              child: Image.asset(
                'assets/Shake it - Logo.png',
                height: 200,
                width: 200,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    const String appLink =
                        "https://github.com/eajane28/shake_eat/releases";
                    const String message =
                        "Checkout this awesome app for choosing where to eat randomly!\n$appLink";
                    Share.share(message);
                  },
                  child: Container(
                    width: 35,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBAB10).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Stack(children: [
                        Icon(Icons.share, color: Color(0xFFFBAB10)),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(width: 13.0),
                GestureDetector(
                  onTap: viewModel.toHomeView,
                  child: Container(
                    width: 35,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBAB10).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Stack(
                        children: [SvgPicture.asset(SvgIcons.dine)],
                      ),
                    ),
                  ),
                ),
              ],
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
