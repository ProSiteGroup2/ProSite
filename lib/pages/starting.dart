
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:group2/pages/select.dart';

class Starting extends StatelessWidget {
  const Starting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/imgs/getstart.png"),
                fit: BoxFit.cover,
                alignment: Alignment.topRight),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 75, 0, 0),
                  child: Text(
                    "Hello,",
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 60.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Text(
                    "Find your need,",
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
                  child: Text(
                    "Discover more...",
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 350, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Select()),
                        );
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 30.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
