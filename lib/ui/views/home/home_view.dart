import 'package:flutter/material.dart';
import 'package:food_frenzy/ui/views/widgets/button.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () => viewModel.backPress(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Stack(children: [
                    Center(
                      child: GestureDetector(
                          onTap: viewModel.navigateToShaking,
                          child: SizedBox(
                            height: 250,
                            child: Image.asset(
                              'assets/icon/shaking.png',
                              fit: BoxFit.fitWidth,
                            ),
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 200.0),
                      child: Text(
                        'Choose your meal preference base on the categories:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFFBAB10),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 9.0),
                  GestureDetector(
                      onTap: viewModel.showPriceRange,
                      child: const SelectionButton(title: 'Price')),
                  GestureDetector(
                      onTap: viewModel.showDietRange,
                      child: const SelectionButton(title: 'Diet')),
                  GestureDetector(
                      onTap: viewModel.showDistanceRange,
                      child: const SelectionButton(title: 'Distance')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
