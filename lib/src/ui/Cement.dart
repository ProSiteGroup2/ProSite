import 'package:flutter/material.dart';


class cement extends StatefulWidget {
  const cement({ Key? key }) : super(key: key);

  @override
  State<cement> createState() => _cementState();
}

class _cementState extends State<cement> {
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
                child: Text("Cement",
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