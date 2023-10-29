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
    final randomRestaurant = viewModel.getRandomRestaurant();
    final restaurantName = randomRestaurant?['name'];
    final imagePath = randomRestaurant?['imagePath'];
    const fallbackImagePath = 'assets/restaurant/logo/paengs.png';
    Widget imageWidget;
    try {
      imageWidget = Image.network(
        imagePath,
        height: 289,
        width: 400,
      );
    } catch (e) {
      imageWidget = Image.asset(
        fallbackImagePath,
        height: 289,
        width: 400,
      );
    }
    return WillPopScope(
      onWillPop: () => viewModel.backPress(),
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
             if (details.primaryVelocity! < 0) viewModel.navigateToDetails(); // swipe left
            },
            onTap: viewModel.navigateToDetails,
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
                                    horizontal: 4.0,
                                  ),
                                  width: 61,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFBAB10),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  width: 61,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  width: 61,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0, left: 8.0, right: 8.0),
                              child: Center(
                                child: Text(
                                  restaurantName!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.w700,

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 225.0,
                          left: 50.0,
                          right: 50.0,
                          bottom: 150.0,
                        ),
                        child: imageWidget,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.navigateToShaking();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDA1D1D),
                    ),
                    child: const Text(
                      "Shake Again",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  AfterShakeViewModel viewModelBuilder(BuildContext context) =>
      AfterShakeViewModel();
}
