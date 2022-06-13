
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:group2/pages/regcont.dart';
import 'package:group2/pages/reghw.dart';
import 'package:group2/pages/reglab.dart';
import 'package:group2/pages/regtran.dart';

class Choose extends StatefulWidget {
  const Choose({Key? key}) : super(key: key);

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/imgs/choose.png"),
                fit: BoxFit.fill,
                alignment: Alignment.center),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                  child: Text(
                    "Choose,",
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5D5D5D)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text(
                    "Category,",
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 40.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF5D5D5D)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(300, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Select()),
                      // );
                    },
                    child: Text(
                      'How to\nregister',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 50.0, horizontal: 10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.elliptical(1000, 1000))),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegHw()),
                        );
                      },
                      child: Text(
                        'Hardware Owner',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'poppins',
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shadowColor: Colors.black87,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 30.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegCont()),
                        );
                      },
                      child: Text(
                        'Contractor',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'poppins',
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shadowColor: Colors.black87,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 64.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegLab()),
                        );
                      },
                      child: Text(
                        'Labour',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'poppins',
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shadowColor: Colors.black87,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 86.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegTran()),
                        );
                      },
                      child: Text(
                        'Transportation',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'poppins',
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shadowColor: Colors.black87,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 42.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0),
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
