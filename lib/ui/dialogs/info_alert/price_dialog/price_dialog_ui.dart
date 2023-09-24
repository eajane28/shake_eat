import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PriceDialogViewModel extends BaseViewModel {
  List<String> labels = ["Cheap", "Affordable", "Expensive"];
  List<bool> checkBoxValues = [false, false, false];

  void updateCheckBoxValue(int index, bool newValue) {
    checkBoxValues[index] = newValue;
    notifyListeners();
  }
}

class PriceDialogUi extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const PriceDialogUi({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PriceDialogViewModel>.reactive(
      viewModelBuilder: () => PriceDialogViewModel(),
      builder: (context, model, child) {
        Color getColor(Set<MaterialState> states) {
          const Set<MaterialState> interactiveStates = <MaterialState>{
            MaterialState.selected,
            MaterialState.focused,
            MaterialState.pressed,
          };
          if (states.any(interactiveStates.contains)) {
            return Colors.orange;
          }
          return Colors.white;
        }

        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                for (int i = 0; i < model.labels.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 30.0),
                        SizedBox(
                          height: 16,
                          width: 16,
                          child: ColoredBox(
                            color: Colors.white,
                            child: Checkbox(
                              checkColor: Colors.black,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: model.checkBoxValues[i],
                              onChanged: (bool? newValue) {
                                model.updateCheckBoxValue(i, newValue ?? false);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 9.0),
                        Text(
                          model.labels[i],
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
