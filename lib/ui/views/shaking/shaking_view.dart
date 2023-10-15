import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_frenzy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:shake/shake.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ShakingView extends StatelessWidget {
  const ShakingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShakingViewModel>.reactive(
      viewModelBuilder: () => ShakingViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (!viewModel.isShaking) Image.asset('assets/Shake1.png'),
                if (viewModel.isShaking) const ShakeAnimationWidget(),
              ],
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

class ShakingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  late ShakeDetector _detector;
  bool _isShaking = false;
  int _shakeCount = 0; // Initialize a variable to count shakes

  bool get isShaking => _isShaking;
  int get shakeCount => _shakeCount; // Getter for shake count

  ShakingViewModel() {
    _detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        _isShaking = true;
        _shakeCount++; // Increment shake count
        if (kDebugMode) {
          print("Shaking. Shake Count: $_shakeCount"); // Print the shake count
        }
        if(shakeCount > 3){
          _navigationService.navigateToAfterShakeView();
          _detector.stopListening();
          _shakeCount = 0;
        }
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    _detector.stopListening();
    super.dispose();
  }
}
