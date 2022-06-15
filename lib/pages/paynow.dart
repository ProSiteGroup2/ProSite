import 'package:flutter/material.dart';
class paynow extends StatefulWidget {
  const paynow({Key? key}) : super(key: key);

  @override
  State<paynow> createState() => _paynowState();
}

class _paynowState extends State<paynow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 11.0,horizontal: 25.0),
                    child: const Text(
                      "Payment Method",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1.15),
                    ),
                  ),
                  
                    ]), 
              )
            ],
          ),
        ),
      ),
    );
    
  }
}