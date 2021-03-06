// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:group2/common/size.dart';
import 'package:group2/pages/ppayment.dart';



class paynow extends StatefulWidget {
  const paynow({Key? key}) : super(key: key);

  @override
  State<paynow> createState() => _paynowState();
}

class _paynowState extends State<paynow> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _password = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_password);
    }
  }

  @override
  final cons_emailController = TextEditingController();
  final cons_passwordController = TextEditingController();
  late bool _passwordVisible;
  void initState() {
    _passwordVisible = false;
  }

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
                child: Text("Pay Now",
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
                //hr line
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.blueAccent),
                                ),
                              ),
              ),
              Container(
                //delivery
                child: Column(
                  children: [
                       Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.fromLTRB(20,12,20,12),
                          child: Text("Delivery Address",style: TextStyle(
                            fontFamily: "Roboto",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 1.15
                          ),), 
                        ),
                        Container(
                          //payment text
                          padding: const EdgeInsets.only(right: 25,left:25),
                            child: TextFormField(
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(12),
                                        fillColor: Colors.white,
                                        filled: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        hintText: 'enter address',
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                        
                                        border: OutlineInputBorder(
                                          // borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        labelText: 'Enter Address',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.trim().isEmpty) {
                                          return 'Please enter your email address';
                                        }

                                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) => _userEmail = value,
                                    ),
                                  
                          ),
               
                  ],
                ),
              ),
              Container(
                //Contact
                child: Column(
                  children: [
                       Container(
                            //contact number title
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.fromLTRB(20,12,20,12),
                            child: Text("Contact Number",style: TextStyle(
                              fontFamily: "Roboto",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 1.15
                            ),), 
                          ),
                          Container(
                            //contact number text
                            padding: const EdgeInsets.only(right: 25,left:25),
                              child: TextFormField(
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(12),
                                          fillColor: Colors.white,
                                          filled: true,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          hintText: 'contact number',
                                          hintStyle: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                          
                                          border: OutlineInputBorder(
                                            // borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          labelText: 'Contact Number',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.trim().isEmpty) {
                                            return 'Please enter your contact number';
                                          }

                                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                            return 'Please enter a valid number';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) => _userEmail = value,
                                      ),
                                    
                          ),
            
                  ],
                ),
              ),
              Container(
                //Email
                child: Column(
                  children: [
                       Container(
                            //contact number title
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.fromLTRB(20,12,20,12),
                            child: Text("Email Address",style: TextStyle(
                              fontFamily: "Roboto",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 1.15
                            ),), 
                          ),
                          Container(
                            //contact number text
                            padding: const EdgeInsets.only(right: 25,left:25),
                              child: TextFormField(
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        decoration: InputDecoration(
                                          
                                          
                                          contentPadding: EdgeInsets.all(12),
                                          fillColor: Colors.white,
                                          filled: true,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          hintText: 'email',
                                          hintStyle: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                          
                                          border: OutlineInputBorder(
                                            // borderSide: BorderSide.none,
                                            
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          labelText: 'Email Address',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.trim().isEmpty) {
                                            return 'Please enter your Email';
                                          }

                                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                            return 'Please enter a valid Email';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) => _userEmail = value,
                                      ),
                                    
                          ),
            
                  ],
                ),
              ),
              Container(
                //hr line
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.blueAccent),
                                ),
                              ),
              ),
              Container(
              //delivery method
              child: Column(
                children: [
                      Container(
                          //delivery method
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.fromLTRB(20,12,20,12),
                          child: Text("Delivery Method",style: TextStyle(
                            fontFamily: "Roboto",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 1.15
                          ),), 
                        ),
                        Container(
                                //delivery price
                                  margin: const EdgeInsets.fromLTRB(0, 20, 120, 20),
                                  width: kPropWidth(context, 0.5),
                                  height: kPropHeight(context, 0.1),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  
                                    border: Border.all(width: 2, color: Colors.blue.shade100),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.25),
                                      spreadRadius: 10,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          2, 5), // changes position of shadow
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.8),
                                      spreadRadius: 10,
                                      blurRadius: 7,

                                      offset: const Offset(-10,
                                          -10), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      //price
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.fromLTRB(15, 10, 10, 5),
                                      child: Text(
                                        "Rs.119",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                          
                                        ),),
                                    ),
                                    Container(
                                      //price
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.fromLTRB(15, 2, 10, 5),
                                      child: Text(
                                        "Standard Delivery",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "Poppins",
                                          // fontWeight: FontWeight.w100,
                                          
                                        ),),
                                    )
                                  
                                  ],
                                ),
                                ),
                            
                ],
              ),
            ),
              Container(
              //hr line
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.blueAccent),
                              ),
                            ),
            ),
              Container(
              //product summary
                  child: Row(
                    children: [
                        Container(
                          //image
                          margin: EdgeInsets.fromLTRB(15,0,15,10),
                          alignment: Alignment.center,
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage("assets/imgs/logo.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          //item details
                          child: Column(
                            children: [
                              Container(
                                //item name
                                margin: EdgeInsets.fromLTRB(15,0,15,20),
                                alignment: Alignment.topCenter,
                                child: Text("Item Name",style: TextStyle(
                                fontFamily: "Poppins",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  height: 1.15
                              ),), 
                              ),
                              Container(
                                //price and qty
                                child: Row(
                                  children: [
                                    Container(
                                      //price
                                      margin: EdgeInsets.fromLTRB(15,0,15,10),
                                      alignment: Alignment.topCenter,
                                      child: Text("Rs.10,500",style: TextStyle(
                                      fontFamily: "Poppins",
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        height: 1.15
                                    ),), 
                                    ),
                                    Container(
                                      //price
                                      margin: EdgeInsets.fromLTRB(15,0,15,10),
                                      alignment: Alignment.topCenter,
                                      child: Text("Qty:",style: TextStyle(
                                      fontFamily: "Poppins",
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        height: 1.15
                                    ),), 
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                              
                    ],
                  ),
               ),
              Container(
                //hr line
                margin: EdgeInsets.all(15),
                
                decoration: BoxDecoration(
                  
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey),
                                  
                                ),
                              ),
              ),
              Container(
                child: Column(
                  children: [
                     Container(
                      //total
                       child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                              Container(
                                          //item total word
                                          margin: EdgeInsets.fromLTRB(30,10,15,20),
                                          alignment: Alignment.topLeft,
                                          child: Text("Item Total",style: TextStyle(
                                          fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            height: 1.15
                                        ),), 
                                        ),
                              Container(
                                          //item total price
                                          margin: EdgeInsets.fromLTRB(30,10,30,20),
                                          alignment: Alignment.topRight,
                                          child: Text("Rs.10,500",style: TextStyle(
                                          fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            height: 1.15
                                        ),), 
                                        ),
                         ],
                       ),
                     ),
                      
                     Container(
                      //delivery
                       child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                              Container(
                                          //delivery cost word
                                          margin: EdgeInsets.fromLTRB(30,0,15,20),
                                          alignment: Alignment.topLeft,
                                          child: Text("Delivery Cost",style: TextStyle(
                                          fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            height: 1.15
                                        ),), 
                                        ),
                              Container(
                                          //delivery cost
                                          margin: EdgeInsets.fromLTRB(30,0,30,20),
                                          alignment: Alignment.topRight,
                                          child: Text("Rs.119",style: TextStyle(
                                          fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            height: 1.15
                                        ),), 
                                        ),
                         ],
                       ),
                     ),
                     Container(
                        //hr line
                        margin: EdgeInsets.all(15),
                        
                        decoration: BoxDecoration(
                          
                                        border: Border(
                                          bottom: BorderSide(color: Colors.grey),
                                          
                                        ),
                                      ),
                      ),
                     Container(
                      margin: EdgeInsets.fromLTRB(30,10,30,20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Container(
                              //total final display bottom
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    //total word
                                    margin: EdgeInsets.all(10),
                                    child: Text("Total",style: TextStyle(
                                            fontFamily: "Poppins",
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              height: 1.15
                                          ),),
                                  ), 
                                  Container(
                                    //final price
                                    margin: EdgeInsets.all(5),
                                    child: Text("Rs.10,619",style: TextStyle(
                                            fontFamily: "Poppins",
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              height: 1.15,
                                              color: Colors.blue,
                                          ),),
                                  ), 
                                ],
                              ),
                            ),
                            Container(
                                  //seller details
                                  
                                   margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                    width: kPropWidth(context, 0.32),
                                    height: kPropHeight(context, 0.08),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    //  border: Border.all(width: 2, color: Colors.grey.shade200),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.25),
                                        spreadRadius: 10,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            2, 5), // changes position of shadow
                                      ),
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.8),
                                        spreadRadius: 10,
                                        blurRadius: 7,

                                        offset: const Offset(-10,
                                            -10), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ppayment()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.greenAccent[100],
                                      shadowColor:
                                          Colors.grey.withOpacity(0.25),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 0.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        
                                        Container(
                                          //details of a item
                                          margin: EdgeInsets.fromLTRB(0,25,0,0),
                                           width: kPropWidth(context, 0.2),
                                           height: kPropHeight(context, 0.1),
                                           alignment: Alignment.center,
                                          child: Column(
                                            
                                            children: [
                                              Container(
                                                child: const Text(
                                                  "Proceed",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontFamily: "poppins",
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.15),
                                                ),
                                              ),
                                              
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.green,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              
                        ],
                      ),
                     )
                  ],
                ),
              ),
          ],
        ),
      ),
    ));
    
  }
}