import 'dart:async';
import 'package:group2/components/navigation_bar.dart';
import 'package:group2/pages/paynow.dart';
import 'package:flutter/material.dart';
import 'starting.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:group2/pages/static.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getInt('roll') == 1 &&
        preferences.getInt('logState') == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const NavBar()));
    } else if (preferences.getInt('roll') == 2 &&
        preferences.getInt('logState') == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const paynow()));
    } else if (preferences.getInt('roll') == 3 &&
        preferences.getInt('logState') == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const NavBar()));
    } else if (preferences.getInt('roll') == 4 &&
        preferences.getInt('logState') == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const NavBar()));
    } else if (preferences.getInt('roll') == 5 &&
        preferences.getInt('logState') == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const NavBar()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Starting()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imgs/splash_1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: AnimatedSplashScreen(
            splash: Image.asset(
              'assets/imgs/logo.png',
            ),
            splashTransition: SplashTransition.scaleTransition,
            splashIconSize: 250,
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
