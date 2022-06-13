import 'package:flutter/material.dart';

class bricks extends StatefulWidget {
  const bricks({ Key? key }) : super(key: key);

  @override
  State<bricks> createState() => _bricksState();
}

class _bricksState extends State<bricks> {
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
                child: Text("Bricks",
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