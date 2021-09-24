import 'package:flutter/material.dart';
import 'package:younusorvba/views/user_view_list.dart';

class SignInProvider extends ChangeNotifier {
  bool passwordVisible = false;

  void passwordVisibleFunction() {
    if (passwordVisible == false) {
      passwordVisible = true;
    } else {
      passwordVisible = false;
    }

    notifyListeners();
  }

  loginButton(context, bool currentState) {
    if (currentState) {
      Navigator.pushReplacementNamed(context, UserViewList.route);
    }
  }
}
