import 'package:flutter/material.dart';
import 'package:food_frenzy/model/onboarding_data.dart';

class IndividualOnboarding extends StatelessWidget {
  const IndividualOnboarding({super.key, required this.data});
  final OnboardingData data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        data.imagePage, // TODO: Add image path here
        fit: BoxFit.cover,),
    );
  }
}
