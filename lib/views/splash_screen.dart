import 'package:flutter/material.dart';
import 'package:younusorvba/provider/internet_check_provider.dart';
import 'package:younusorvba/provider/splash_screen_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const route = "/";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    netCheck();
  }

  netCheck() async {
    bool netResul =
        await context.read<InterNetCheckProvier>().netCheck(context);

    if (netResul == true) {
      context.read<SplashScreenProvider>().nextScreen(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/images/Background.png",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            const Center(
              child: Text(
                "ORVBA",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
