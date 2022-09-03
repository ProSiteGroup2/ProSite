// ignore_for_file: prefer_const_constructors, unused_import
import 'package:flutter/material.dart';
import 'package:group2/components/contractor_navbar.dart';
import 'package:group2/components/hardware_navbar.dart';
import 'package:group2/components/labour_navbar.dart';
import 'package:group2/components/navigation_bar.dart';
import 'package:group2/components/trans_navbar.dart';
import 'package:group2/pages/add_product.dart';
import 'package:group2/pages/additem.dart';
import 'package:group2/pages/customer_contractorview.dart';
import 'package:group2/pages/customer_labourpview.dart';
import 'package:group2/pages/customer_transporterview.dart';
import 'package:group2/pages/hardware_dashboard.dart';
import 'package:group2/pages/loginas_cons.dart';
import 'package:group2/pages/loginpage.dart';
import 'package:group2/pages/product_edit.dart';
import 'package:group2/pages/select.dart';
import 'package:group2/pages/splashscreen.dart';
import 'package:group2/pages/starting.dart';
import 'package:group2/src/ui/sp_home_screen.dart';
import 'package:group2/src/ui/home_screen.dart';
import 'package:group2/pages/notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
        initialRoute: '/start',
        routes: {
          // '/home': (context) => HomeScreen(),    //give the home page class name
          '/start': (context) => SplashScreen(), //give the start page class name
          '/navbar': (context) => NavBar(), //give the navbar page class name
          '/notifications': (context) => Notifications(),
          '/hrddashboard':(context)=>HrdDashboard(),
          '/addItem':(context)=>Additem(),
          '/SPLogin':(context)=>LoginPage(),
          '/addProduct':(context)=> AddProduct(),
          '/SP_HomeScreen':(context) =>SP_HomeScreen(),
          '/HomeScreen':(context)=>HomeScreen(),
          '/ConsumerLogin':(context)=>Loginas_cons(),
          '/labourNavBar':(context)=>LabNavBar(),
          '/transporterNavBar':(context)=>TransNavBar(),
          '/contractorNavBar':(context)=>ConNavBar(),
          '/hdNavBar':(context)=>HdNavBar(),
          '/select':(context)=>Select(),
          '/editProduct':(context)=>editProduct(),
          // .....
          // ...... give other pages class name like above
        });
  }
}
