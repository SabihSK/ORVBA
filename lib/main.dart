import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'provider/internet_check_provider.dart';
import 'provider/sign_in_provider.dart';
import 'provider/sign_up_provider.dart';
import 'provider/splash_screen_provider.dart';
import 'provider/user_view_list_provider.dart';
import 'routes/routes.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //* Show error message if initialization failed
    if (_error) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const SomethingWrong(),
      );
    }

    //* Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const Loading(),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashScreenProvider>(
            create: (_) => SplashScreenProvider()),
        ChangeNotifierProvider<SignUpProvider>(create: (_) => SignUpProvider()),
        ChangeNotifierProvider<SignInProvider>(create: (_) => SignInProvider()),
        ChangeNotifierProvider<InterNetCheckProvier>(
            create: (_) => InterNetCheckProvier()),
        ChangeNotifierProvider<UserViewListProvider>(
            create: (_) => UserViewListProvider()),
      ],
      child: MaterialApp(
        title: 'ORVBA',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.route,
        routes: getRoutes(),
      ),
    );
  }
}

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ok data"),
      ),
    );
  }
}

class SomethingWrong extends StatefulWidget {
  const SomethingWrong({Key? key}) : super(key: key);

  @override
  _SomethingWrongState createState() => _SomethingWrongState();
}

class _SomethingWrongState extends State<SomethingWrong> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Some thing wrong",
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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
            const Center(
              child: Text("Loading..."),
            ),
          ],
        ),
      ),
    );
  }
}
