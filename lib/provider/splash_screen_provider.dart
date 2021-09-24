import 'dart:async';

import 'package:flutter/material.dart';
import 'package:younusorvba/views/sign_in.dart';

class SplashScreenProvider extends ChangeNotifier {
  nextScreen(context) async {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, SignIn.route);
    });
  }
}
