import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DistanceDialogViewModel extends BaseViewModel {
  double sliderValue = 1;

  void updateSliderValue(double newValue) {
    sliderValue = newValue;
    notifyListeners();
  }
}

class DistanceDialogUi extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DistanceDialogUi({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DistanceDialogViewModel>.reactive(
      viewModelBuilder: () => DistanceDialogViewModel(),
      builder: (context, model, child) {
        double maxSlider = 20;
        String distanceLabel = 'Near'; // Default label

        if (model.sliderValue <= maxSlider/3) {
          distanceLabel = 'Near';
        } else if (model.sliderValue <= (maxSlider/3)*2){
          distanceLabel = 'Moderate';
        } else {
          distanceLabel = 'Far';
        }

        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: const Color(0xFFFBAB10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    request.title!,
                    style: const TextStyle(
                        color: Color(0xFFDA1D1D),
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      const SizedBox(width: 30.0),
                      Text(
                        distanceLabel, // Display the dynamically determined label
                        style: const TextStyle(
                          color: Color(0xFFDA1D1D),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Slider(
                    value: model.sliderValue,
                    onChanged: (double newValue) {
                      model.updateSliderValue(newValue);
                    },
                    min: 1,
                    max: maxSlider,
                    divisions: 19,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '${model.sliderValue.toStringAsFixed(0)} km less', // Display the slider value
                    style: const TextStyle(
                      color: Color(0xFFDA1D1D),
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Color(0xFFDA1D1D),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
