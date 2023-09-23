import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'shaking_viewmodel.dart';

class ShakingView extends StackedView<ShakingViewModel> {
  const ShakingView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      ShakingViewModel viewModel,
      Widget? child,
      ) {
    return const Scaffold(
      body: Center(
        child: ShakeAnimationWidget(), // Use the ShakeAnimationWidget
      ),
    );
  }

  @override
  ShakingViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      ShakingViewModel();
}

class ShakeAnimationWidget extends StatefulWidget {
  const ShakeAnimationWidget({super.key});

  @override
  _ShakeAnimationWidgetState createState() => _ShakeAnimationWidgetState();
}

class _ShakeAnimationWidgetState extends State<ShakeAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create an AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    // Create a Tween to define the shake animation
    _animation = Tween<double>(
      begin: -5.0,
      end: 5.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0),
          child: Image.asset('assets/Shake1.png'), // Replace with your image
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}