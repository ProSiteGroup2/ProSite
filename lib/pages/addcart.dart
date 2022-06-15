import 'package:flutter/material.dart';



class addcart extends StatefulWidget {
  const addcart({Key? key}) : super(key: key);

  @override
  State<addcart> createState() => _addcartState();
}

class _addcartState extends State<addcart> {
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
                      "Add to Cart",
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