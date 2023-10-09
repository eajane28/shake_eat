import 'package:flutter/material.dart';
import 'package:food_frenzy/model/onboarding_data.dart';

class IndividualOnboarding extends StatelessWidget {
  const IndividualOnboarding({super.key, required this.data});
  final OnboardingData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 200,
        ),
        Center(
          child: Image.asset(
            data.imagePage,
            height: 300,
            width: 300,
            // fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 25.0, left: 25.0, top: 50.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
            child: Text(
              data.message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF78746D),
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
