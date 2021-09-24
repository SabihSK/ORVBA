import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  String verticalGroupValue = "??";

  setRadioButtonText(value) {
    verticalGroupValue = value as String;
    print(verticalGroupValue);
    notifyListeners();
  }

  bool registerPasswordVisible = false;

  void registerPasswordVisibleFunction() {
    if (registerPasswordVisible == false) {
      registerPasswordVisible = true;
    } else {
      registerPasswordVisible = false;
    }
    notifyListeners();
  }

  bool registerRePasswordVisible = false;

  void registerRePasswordVisibleFunction() {
    if (registerRePasswordVisible == false) {
      registerRePasswordVisible = true;
    } else {
      registerRePasswordVisible = false;
    }
    notifyListeners();
  }
}
