// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:group2/common/size.dart';



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
                      alignment: Alignment.centerLeft,
                      width: 110,
                      height: 100,
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
                          
                ],
              ),
            ),
          ],
        ),
      ),
    ));
    
  }
}