// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:group2/common/size.dart';



class addcart extends StatefulWidget {
  const addcart({Key? key}) : super(key: key);

  @override
  State<addcart> createState() => _addcartState();
}

class _addcartState extends State<addcart> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color(0xE5E5E5),
        elevation: 0,
        toolbarHeight: 50,
        bottom: PreferredSize(
          preferredSize:Size.fromHeight(kPropHeight(context, 0.05)),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.bottomCenter,
                child: Text("Add to Cart",
                style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  height: 1.15
                ),
                
                ),
              ),
            ],
          ),
        ),
         
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
                //payment text
               
            ],
        ),
      ),
    ));
    
  }
}