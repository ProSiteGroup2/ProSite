// ignore_for_file: prefer_const_constructors, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:group2/components/navigation_bar.dart';
import 'package:group2/pages/add_product.dart';
import 'package:group2/pages/additem.dart';
import 'package:group2/pages/hardware_dashboard.dart';
import 'package:group2/pages/loginpage.dart';
import 'package:group2/pages/splashscreen.dart';
import 'package:group2/pages/starting.dart';
import 'package:group2/src/ui/home_screen.dart';
import 'package:group2/pages/notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'dart:ui';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51LRh1yA1g3LxeRvZTQSjApuwK0JjVDBUm32BzFJu4Y1r1cQZhTbGzV5WnTqfqjcmORQHhx3vdvKgnOvgIgQIA2DO00ewTfdIiI';
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
        initialRoute: '/start',
        routes: {
          // '/home': (context) => HomeScreen(),    //give the home page class name
          '/start': (context) =>
              SplashScreen(), //give the start page class name
          '/navbar': (context) => NavBar(), //give the navbar page class name
          '/notifications': (context) => Notifications(),
          '/hrddashboard': (context) => HrdDashboard(),
          '/addItem': (context) => Additem(),
          '/SPLogin': (context) => LoginPage(),
          '/addProduct': (context) => AddProduct(),
          // .....
          // ...... give other pages class name like above
        });
  }
}
