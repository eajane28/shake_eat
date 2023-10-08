import 'package:flutter/material.dart';

class IndividualOnboarding extends StatelessWidget {
  const IndividualOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/onboarding_1.png', // TODO: Add image path here
        fit: BoxFit.cover,),
    );
  }
}
