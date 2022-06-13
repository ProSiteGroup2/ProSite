import 'package:flutter/material.dart';


class steel extends StatefulWidget {
  const steel({ Key? key }) : super(key: key);

  @override
  State<steel> createState() => _steelState();
}

class _steelState extends State<steel> {
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
                child: Text("Steel",
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