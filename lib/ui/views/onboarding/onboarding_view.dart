import 'package:flutter/material.dart';
import 'package:food_frenzy/ui/views/widgets/individual_onboarding.dart';
import 'package:stacked/stacked.dart';

import '../widgets/onboarding_footer.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView(
              physics: const BouncingScrollPhysics(),
              controller: viewModel.pageController,
              onPageChanged: viewModel.onPageChanged,
              children: viewModel.onBoardingList
                  .map((e) => IndividualOnboarding(
                        data: e,
                      ))
                  .toList()),
        ),
        OnboardingFooter(
          itemSize: viewModel.onBoardingList.length,
          selectedPosition: viewModel.selectedPosition,
        )
      ],
    ));
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}
