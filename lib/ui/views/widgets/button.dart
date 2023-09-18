import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  const SelectionButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0),
      child: Container(
        height: 30.86,
        width: 100.89,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: const Color(0xFFFBAB10),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFFDA1D1D),
            ),
          ),
        ),
      ),
    );
  }
}
