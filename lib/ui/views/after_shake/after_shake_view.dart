import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import 'after_shake_viewmodel.dart';


class AfterShakeView extends StackedView<AfterShakeViewModel> {
  const AfterShakeView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      AfterShakeViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 405,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDA1D1D),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                      bottomLeft: Radius.circular(150.0),
                      bottomRight: Radius.circular(150.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 225.0, left: 50.0, right: 50.0),
                  child: Image.asset('assets/paengs.png',
                      height: 289, width: 400),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: ElevatedButton(
                onPressed: () {
                  openMapWithDirections("SPBg868AV5zXueX47");
                },
                child: const Text(
                  'Open in Map',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: viewModel.navigateToShaking,
                child: Container(
                  width: 137.0,
                  height: 39.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDA1D1D),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Shake again',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openMapWithDirections(String mapId) async {
    if (kDebugMode) {
      print("Creating variable for map");
    }
    Uri map = Uri.https('maps.app.goo.gl', '/$mapId', {
    });
    if (kDebugMode) {
      print("Map created");
      print(map);
      print("Launching map");
    }
    launchUrl(map);
    // if (await canLaunchUrl(map)) {
    //   await launchUrl(map);
    // } else {
    //   throw 'Could not launch';
    // }
  }

  @override
  AfterShakeViewModel viewModelBuilder(BuildContext context) =>
      AfterShakeViewModel();
}