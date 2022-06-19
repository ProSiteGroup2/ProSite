import 'dart:async';
import 'package:group2/pages/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'starting.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() async {
    if (logState == '0' && signState == '0') {
      Timer(
          Duration(seconds: 4),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => Starting())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/imgs/splash_1.png"),
                fit: BoxFit.cover,
                alignment: Alignment.topRight),
          ),
          child: AnimatedSplashScreen(
            splash: Image.asset('assets/imgs/logo.png'),
            splashTransition: SplashTransition.scaleTransition,
            duration: 60000,
            nextScreen: Starting(),
          ),
        ),
      ),
    );
    //   return MaterialApp(

    //     debugShowCheckedModeBanner: false,
    //     home: AnimatedSplashScreen(

    //       splash: Image.asset('assets/logo.png'),
    //       splashTransition: SplashTransition.scaleTransition,
    //       duration: 60000,
    //       nextScreen: Starting(),
    //     ),
    //   );
    // }
  }
}
