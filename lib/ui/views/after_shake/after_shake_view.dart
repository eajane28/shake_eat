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
    final restaurantName = randomRestaurant['name'];
    final imagePath = randomRestaurant['imagePath'];

    return WillPopScope(
      onWillPop: () => viewModel.backPress(),
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
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
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Text(
                                restaurantName!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 36.0,
                                  fontWeight: FontWeight.w700,
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
                        ),
                        child: Image.asset(
                          imagePath!,
                          height: 289,
                          width: 400,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        viewModel.openMapWithDirections("SPBg868AV5zXueX47");
                      },
                      icon: const Icon(Icons.redo), // Google Maps icon
                      label: const Text(
                        're-shake',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  // Other widgets
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
