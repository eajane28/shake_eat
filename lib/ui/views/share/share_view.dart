import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'share_viewmodel.dart';

class ShareView extends StackedView<ShareViewModel> {
  const ShareView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ShareViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 138.0,
              decoration: const BoxDecoration(
                color: Color(0xFFFBAB10),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Row(children: [
                const SizedBox(width: 30.0),
                GestureDetector(
                    onTap: null,
                    child: const Icon(Icons.chevron_left,
                        color: Colors.white, size: 40.0)),
                const Text(
                  'Share to',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]),
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 18.0),
                padding: const EdgeInsets.only(top: 96.0),
                width: double.infinity,
                height: MediaQuery.of(context).size.height -176,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ]),
        ],
      ),
    ));
  }

  @override
  ShareViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShareViewModel();
}
