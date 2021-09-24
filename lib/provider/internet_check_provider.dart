// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:younusorvba/views/splash_screen.dart';

class InterNetCheckProvier extends ChangeNotifier {
  netCheck(context) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');

      Widget okButton = TextButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.pushReplacementNamed(context, SplashScreen.route);
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: const Text("No Internet"),
        content: const Text(
            "Please check your internet connection.\nRestart your application."),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
      return false;
    }
  }
}
