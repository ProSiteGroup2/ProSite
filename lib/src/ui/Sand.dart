import 'package:flutter/material.dart';

class sand extends StatefulWidget {
  const sand({ Key? key }) : super(key: key);

  @override
  State<sand> createState() => _sandState();
}

class _sandState extends State<sand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.bottomCenter,
                child: Text("Sand",
                style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 1.15
                ),
                
                ),
              )
            ],
          ),
        )),
      
    );
  }
}