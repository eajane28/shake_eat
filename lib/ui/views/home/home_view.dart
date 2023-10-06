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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset("assets/Shake it - Logo.png"),
                const Text(
                  'Choose your meal preference base on the categories:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFBAB10),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                      height: 250,
                      child: GestureDetector(
                          onTap: viewModel.navigateToShaking,
                          child: Image.asset('assets/shake.png'))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
