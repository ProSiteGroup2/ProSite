// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/notification_methods.dart';
import 'package:group2/common/size.dart';
import 'package:group2/globals.dart';
import 'package:group2/pages/PaymentScreen.dart';
import 'package:group2/pages/add_card_details.dart';
import 'package:group2/pages/flutter_card.dart';
import 'package:group2/pages/ppayment.dart';

import '../Classes/order_methods.dart';
import '../Classes/product_methods.dart';



class paynow extends StatefulWidget {

  final quantity;

  const paynow({
    Key? key,
    required this.quantity

  }
      ) : super(key: key);

  @override
  State<paynow> createState() => _paynowState();
}

class _paynowState extends State<paynow> {
  final _formKey = GlobalKey<FormState>();

  String _contactNo = '';
  String _email = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_contactNo);
      debugPrint(_email);
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
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        toolbarHeight: 50,
        bottom: PreferredSize(
          preferredSize:Size.fromHeight(kPropHeight(context, 0.05)),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                margin: EdgeInsets.all(10),
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
                //Contact
                child: Column(
                  children: [
                       Container(
                            //contact number title
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.fromLTRB(20,12,20,15),
                            child: Text("Contact Number",style: TextStyle(
                              fontFamily: "Roboto",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 1.15
                            ),), 
                          ),
                          Container(
                            //contact number text
                            margin: EdgeInsets.fromLTRB(0,10,0,0),
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
                                          return null;
                                        },
                                        onChanged: (value) => _contactNo = value,
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
                            margin: EdgeInsets.fromLTRB(20,20,20,12),
                            child: Text("Email Address",style: TextStyle(
                              fontFamily: "Roboto",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 1.15
                            ),), 
                          ),
                          Container(
                            //contact number text
                             margin: EdgeInsets.fromLTRB(0,10,0,12),
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
                                        onChanged: (value) => _email = value,
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
                          margin: EdgeInsets.fromLTRB(15,10,15,10),
                          alignment: Alignment.center,
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage("${product['imageUrl']}"),
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
                                margin: EdgeInsets.fromLTRB(0,10,15,20),
                                alignment: Alignment.topCenter,
                                child: Text("${product['productname']}",style: TextStyle(
                                fontFamily: "Poppins",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  height: 1.15
                              ),
                                softWrap: true,),
                              ),
                              Container(
                                //price and qty
                                child: Row(
                                  children: [
                                    Container(
                                      //price
                                      margin: EdgeInsets.fromLTRB(0,5,15,10),
                                      alignment: Alignment.topCenter,
                                      child: Text("Rs. ${product['price']}",style: TextStyle(
                                      fontFamily: "Poppins",
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        height: 1.15
                                    ),), 
                                    ),
                                    Container(
                                      //price
                                      margin: EdgeInsets.fromLTRB(15,0,15,10),
                                      alignment: Alignment.topCenter,
                                      child: Text("Qty: ${widget.quantity}",style: TextStyle(
                                      fontFamily: "Poppins",
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
                child: Column(
                  children: [
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Container(
                              //total final display bottom
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    child: Text("Rs. ${product['price']*widget.quantity}",style: TextStyle(
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
                            SizedBox(height:20.0),
                            Container(
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
                                    onPressed: () async {
                                      setState(() {
                                        product['stock']=product['stock']-widget.quantity;
                                      });
                                      await ProductMethods().productStockUpdate(product['_id'], product['stock']);
                                      var buyerID;
                                      if(consumer.isNotEmpty){
                                        buyerID=consumer['_id'];
                                      }else{
                                        buyerID=sp['_id'];
                                      }

                                      await OrderMethods().addOrder(buyerID,product['_id'], widget.quantity, product['price']*widget.quantity, product['seller']);
                                      var result=await NotificationMethods().purchaseNotify(buyerID, "${product['productname']} has been Purchased", product['seller'], product['_id']);
                                      if(result.data['success']){
                                        var local_notification=result.data['notification'];
                                        await NotificationMethods().pushNotifytoSeller(product['seller']['_id'], local_notification['_id']);
                                        var result2= await NotificationMethods().pushNotifytoBuyer(buyerID, local_notification['_id']);
                                        if(result2.data['success']){
                                          Fluttertoast.showToast(
                                              msg: 'Notification added',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      }

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                             MySample(amount:product['price']*widget.quantity))
                                                // Payment(amount:"55")),
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
                                                  "Pay Now",
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