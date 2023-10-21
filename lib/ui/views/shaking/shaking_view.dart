import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'shaking_viewmodel.dart';

class ShakingView extends StatelessWidget {
  const ShakingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShakingViewModel>.reactive(
      viewModelBuilder: () => ShakingViewModel(),
      builder: (context, viewModel, child) {
        return WillPopScope(
          onWillPop: () => viewModel.backPress(),
          child: Scaffold(
            body: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (!viewModel.isShaking)
                    Image.asset('assets/icon/shaking.png'),
                  if (viewModel.isShaking) const ShakeAnimationWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ShakeAnimationWidget extends StatefulWidget {
  const ShakeAnimationWidget({Key? key}) : super(key: key);

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

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animation = Tween<double>(
      begin: -5.0,
      end: 5.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0),
          child:
              Image.asset('assets/icon/shaking.png'), // Replace with your image
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
