import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stacked/stacked.dart';

import '../widgets/panel_widget.dart';
import 'no_vouchers_viewmodel.dart';

class NoVouchersView extends StackedView<NoVouchersViewModel> {
  const NoVouchersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NoVouchersViewModel viewModel,
    Widget? child,
  ) {
    final panelHeightClosed = MediaQuery.of(context).size.height * .05;
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: panelHeightClosed,
        maxHeight: MediaQuery.of(context).size.height * .9,
        margin: const EdgeInsets.symmetric(horizontal: 22),
        body: SafeArea(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: null,
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
                        padding: const EdgeInsets.only(top: 65.0),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    width: 61,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    width: 61,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    width: 61,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFBAB10),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ]),
                            const Padding(
                              padding: EdgeInsets.only(top: 25.0),
                              child: Text(
                                'Sorry!',
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ... your existing UI code here ...

                      // Add the timer display
                      const Padding(
                        padding: EdgeInsets.only(top: 345.0),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                '😭',
                                style: TextStyle(
                                  fontSize: 150,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 80.0),
                              child: Text(
                                'No Vouchers Available',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xFFDA1D1D),
                                  fontWeight: FontWeight.w600,
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
        ),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
      ),
    );
  }

  @override
  NoVouchersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NoVouchersViewModel();
}
