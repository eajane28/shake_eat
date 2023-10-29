import 'package:flutter/material.dart';
import '../../../model/details_data.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({super.key, required this.item});
  final DetailsData item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.0),
      child: Container(
          width: 256.0,
          height: 243.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Image.network(
            item.image,
            fit: BoxFit.cover,
          )),
    );
  }
}
