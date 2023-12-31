import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../widgets/details_container.dart';
import 'details_viewmodel.dart';

class DetailsView extends StackedView<DetailsViewModel> {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! < 0) viewModel.navigateToRedeem(); // swipe left
            else if (details.primaryVelocity! > 0) viewModel.navigateToAfterShake(); // swipe right
          },
          onTap: viewModel.navigateToRedeem,
          child: SingleChildScrollView(
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
                                    color: const Color(0xFFFBAB10),
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
                              ]),
                          const Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child: Text(
                              'Menu',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(60.0, 178.0, 60.0, 0.0),
                        child: Column(children: [
                          for (var item in viewModel.detailsList)
                            DetailsContainer(item: item),
                        ]),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  DetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DetailsViewModel();
}
