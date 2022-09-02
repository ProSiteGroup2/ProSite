import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/order_methods.dart';
import 'package:group2/Classes/product_methods.dart';
import 'package:group2/common/size.dart';
import 'package:group2/globals.dart';
import 'package:group2/pages/flutter_card.dart';

class paynow_cart extends StatefulWidget {
  final List<dynamic> tags;
  final total_price;
  const paynow_cart({
    Key? key,
    required this.total_price,
    required this.tags
  }) : super(key: key);

  @override
  State<paynow_cart> createState() => _paynow_cartState(tags:tags);
}

class _paynow_cartState extends State<paynow_cart> {
  List<dynamic> tags;
  _paynow_cartState({required this.tags});
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
                  child: Column(
                    children: [
                      Text('Cart',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'
                      ),),
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
                            image: AssetImage('assets/imgs/cart_image.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

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
                                    child: Text("Rs.${widget.total_price}",style: TextStyle(
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
                                  for(var i=0;i<tags.length;i++){
                                    setState(() {
                                      tags[i]['product']['stock']=tags[i]['product']['stock']-tags[i]['quantity'];
                                    });
                                    await ProductMethods().productStockUpdate(tags[i]['product']['_id'], tags[i]['product']['stock']);
                                  }
                                  var buyerID;
                                  if(consumer.isNotEmpty){
                                    buyerID=consumer['_id'];
                                  }else{
                                    buyerID=sp['_id'];
                                  }
                                  for(var i=0;i<tags.length;i++){
                                    await OrderMethods().addOrder(buyerID, tags[i]['product']['_id'], tags[i]['quantity'], tags[i]['price'], tags[i]['product']['seller']);

                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MySample(amount:widget.total_price))
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
