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
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.fromLTRB(20,10,20,20),
                child: Text("Payment Method",style: TextStyle(
                   fontFamily: "Roboto",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 1.15
                ),), 
              ),
              Container(
                  child: TextField(
                            style: const TextStyle( height: 0.5 ),
                            cursorColor: Colors.grey,
                            
                              decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(right: 15,left: 18),
                              fillColor: Colors.white,
                              filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none
                                  
                                ),
                                
                              hintText: 'Search Category...',
                              hintStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                                fontSize: 14
                              ),
                            ),
                                      ),
              )
            ],
          ),
        ),
      ),
    );
    
  }
}