import 'package:flutter/material.dart';
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
      body: Padding(padding: EdgeInsets.fromLTRB(36.0, 196.0, 36.0, 0.0),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/Shake it - Logo.png"),
              const Text('Choose your preference',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFBAB10),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),)
            ],
          ),
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
