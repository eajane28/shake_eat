import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastMessage(String message, int duration) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      timeInSecForIosWeb: duration,
      fontSize: 16.0,
    );
void cancelToastMessage(){
      Fluttertoast.cancel();
}