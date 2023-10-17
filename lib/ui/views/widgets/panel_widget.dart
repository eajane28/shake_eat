import 'package:flutter/material.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  const PanelWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        controller: controller,
        children: [
          Column(
            children: [
              Image.asset(
                'assets/arrow_up.png',
              ),
              const Text(
                'Let\'s eat!',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFFDA1D1D),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          //TO DO: Add the map API
          Image.asset('assets/map.png'),
        ],
      );
}
