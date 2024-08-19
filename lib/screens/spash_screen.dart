import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trial2/screens/welcome_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a long-running task, such as loading data or initializing the app
    // Delay for 2 seconds and then navigate to the next screen
    Timer(Duration(seconds: 2), () {
      // Navigate to the next screen, for example, the home screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => WelcomeScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Customize the splash screen UI as needed
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/Vector.png'),

            Spacer(),
            CircularProgressIndicator(), // Optionally, add a loading indicator
          ],
        ),
      ),
    );
  }
}
