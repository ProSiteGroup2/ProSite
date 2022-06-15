// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:group2/components/navigation_bar.dart';
import 'package:group2/pages/starting.dart';
import 'package:group2/src/ui/home_screen.dart';

// import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //  home: HomeScreen(),
        //  home: NavBar(),
        initialRoute: '/navbar',
        routes: {
          // '/home': (context) => HomeScreen(),    //give the home page class name
          '/start': (context) => Starting(), //give the start page class name
          '/navbar': (context) => NavBar(), //give the navbar page class name
          // .....
          // ...... give other pages class name like above
        });
  }
}
