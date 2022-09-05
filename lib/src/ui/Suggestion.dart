// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/cart_methods.dart';
import 'package:group2/common/size.dart';
import 'package:group2/pages/addcart.dart';
import 'package:group2/pages/customer_hdprofileview.dart';
import 'package:group2/pages/customer_spprofileview.dart';
import 'package:group2/pages/paynow.dart';
import 'package:group2/pages/user_profile.dart';
import 'package:group2/src/ui/user_api.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../globals.dart';

class Suggestions_det extends StatefulWidget {
  final User user;
  const Suggestions_det({
    Key? key, required this.user,
  }) : super(key: key);

  @override
  State<Suggestions_det> createState() => _Suggestions_detState();
}

class _Suggestions_detState extends State<Suggestions_det>
    with TickerProviderStateMixin {
  late User user;
  TextEditingController quantityController = TextEditingController();
  @override
  void initState() {
    quantityController.text = "1";
    // TODO: implement initState
    super.initState();
  }

  var local_quantity = 1;
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xE5E5E5),
        elevation: 0,
        toolbarHeight: 60,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => addcart()),
                );
              },
            ),
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //image box
                width: kPropWidth(context, 1) - 20,
                height: kPropHeight(context, 0.40) - 32,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: Offset(1, 4), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: Offset(-10, -10), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.user.imageUrl,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                //Title and price
                width: kPropWidth(context, 1) - 70,
                height: kPropHeight(context, 0.42) - 252,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.user.productname,
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            height: 2),
                        softWrap: true,
                      ),
                    ),
                    Container(
                      //price
                      width: kPropWidth(context, 0.22),
                      height: kPropHeight(context, 0.035),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blue[700]!.withOpacity(0.4),
                      ),
                      child: Text(
                        'Rs. ${widget.user.price}',
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                //tabs
                child: Align(
                  alignment: Alignment.center,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 16, right: 16),
                    controller: _tabController,
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins"),
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(text: "Specifications"),
                      Tab(text: "Details"),
                      Tab(text: "About Seller")
                    ],
                  ),
                ),
              ),
              Container(
                height: 180,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      //specifications tab
                      margin: EdgeInsets.only(top: 05),
                      child: Column(
                        children: [
                          Container(
                            width: kPropWidth(context, 1) - 32,
                            //height: kPropHeight(context, 0.4) - 32,
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Category  -   ${widget.user.category}',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: "poppins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        wordSpacing: 0.5,
                                        letterSpacing: 0.8,
                                        height: 1.15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Size  -   ${widget.user.size}",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: "poppins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        wordSpacing: 0.5,
                                        letterSpacing: 0.8,
                                        height: 1.15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Stock  -   ${widget.user.stock}",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: "poppins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        wordSpacing: 0.5,
                                        letterSpacing: 0.8,
                                        height: 1.15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Brand  -   ${widget.user.brand}",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: "poppins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        wordSpacing: 0.5,
                                        letterSpacing: 0.8,
                                        height: 1.15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //details tab
                      margin: EdgeInsets.only(top: 15, left: 10),
                      child: Column(
                        children: [
                          Container(
                            //details tab details
                            width: kPropWidth(context, 1) - 32,
                            //height: kPropHeight(context, 0.4) - 32,
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 15),
                            child: Text(
                              '${widget.user.description}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  height: 1.15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //about seller tab
                      margin: EdgeInsets.only(left: 30, top: 10),
                      child: Column(
                        children: [
                          Container(
                            //about title
                            width: kPropWidth(context, 1) - 32,
                            height: kPropHeight(context, 0.1) - 32,
                            child: Text(
                              "Seller",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                // height: 1.15
                              ),
                            ),
                          ),
                          Container(
                            //about content
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  //seller icon
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 2, 20),
                                  width: kPropWidth(context, 0.2),
                                  height: kPropHeight(context, 0.1),
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
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '${product['seller']['imageUrl']}'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  //seller details
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 20, 20),
                                  width: kPropWidth(context, 0.6),
                                  height: kPropHeight(context, 0.1),
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
                                      sp = product['seller'];
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Customerhdprofileview()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          //details of a item
                                          margin: EdgeInsets.only(top: 20),
                                          width: kPropWidth(context, 0.4),
                                          height: kPropHeight(context, 0.1),
                                          child: Column(
                                            children: [
                                              Container(
                                                // width: kPropWidth(context, 0.5),
                                                // margin: const EdgeInsets.fromLTRB(5, 2, 40, 0),
                                                // padding: const EdgeInsets.only(left: 2.0, right: 2),
                                                child: Text(
                                                  '${product['seller']['hardwarename']}',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontFamily: "poppins",
                                                      fontSize: 15,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.15),
                                                ),
                                              ),
                                              Container(
                                                // width: kPropWidth(context, 0.5),
                                                // margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                                                // padding: const EdgeInsets.only(left: 2.0, right: 2),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      color: Colors.red,
                                                    ),
                                                    SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    Text(
                                                      "${product['seller']['city']}",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Quantity',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (product['stock'] > local_quantity) {
                                    local_quantity++;
                                    quantityController.text =
                                        local_quantity.toString();
                                  }
                                  print(local_quantity);
                                });
                              },
                              icon: Icon(Icons.add)),
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              controller: quantityController,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  local_quantity = int.parse(value);
                                  print(local_quantity);
                                });
                              },
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (local_quantity > 1) {
                                    local_quantity--;
                                    quantityController.text =
                                        local_quantity.toString();
                                  }
                                  print(local_quantity);
                                });
                              },
                              icon: Icon(Icons.remove)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                //buttons
                margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Container(
                  padding: EdgeInsets.only(right: 5, left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //buy now
                        width: kPropWidth(context, 0.37),
                        height: kPropHeight(context, 0.06),
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.only(right: 5, left: 5),
                        decoration: BoxDecoration(
                          // color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              spreadRadius: 5,
                              blurRadius: 3,
                              offset:
                                  Offset(2, 5), // changes position of shadow
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.8),
                              spreadRadius: 5,
                              blurRadius: 3,
                              offset: Offset(
                                  -10, -10), // changes position of shadow
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: kPropWidth(context, 1),
                          height: kPropHeight(context, 0.06),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (product['stock'] >= local_quantity) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          paynow(quantity: local_quantity,)),
                                );
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Entered Quantity is greater than Stock",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                            label: const Text(
                              "Buy Now",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            icon: Icon(
                              Icons.account_balance_wallet_rounded,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        //buy now
                        width: kPropWidth(context, 0.37),
                        height: kPropHeight(context, 0.06),
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.only(right: 5, left: 5),
                        decoration: BoxDecoration(
                          // color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              spreadRadius: 5,
                              blurRadius: 3,
                              offset:
                                  Offset(2, 5), // changes position of shadow
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.8),
                              spreadRadius: 5,
                              blurRadius: 3,
                              offset: Offset(
                                  -10, -10), // changes position of shadow
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: kPropWidth(context, 1),
                          height: kPropHeight(context, 0.06),
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              if (product['stock'] >= local_quantity) {
                                var buyerID;
                                if (consumer.isNotEmpty) {
                                  buyerID = consumer['_id'];
                                } else {
                                  buyerID = sp['_id'];
                                }

                                var result = await CartMethods().addCartProduct(
                                    buyerID,
                                    product['_id'],
                                    local_quantity,
                                    product['price'] * local_quantity);
                                if (result.data['success']) {
                                  var local_cartproduct =
                                      result.data['cartproduct'];
                                  var result2 = await CartMethods()
                                      .addProducttoCart(
                                          buyerID, local_cartproduct['_id']);
                                  if (result2.data['success']) {
                                    Fluttertoast.showToast(
                                        msg: result2.data['msg'],
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Adding product to cart failed',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Adding cartProduct failed',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        'Entered Quantity is greater than Stock',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan[300],
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                            label: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            icon: Icon(
                              Icons.shopping_bag_rounded,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),

                        // child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Container(
                        //       //buy now text
                        //       alignment: Alignment.centerRight,
                        //       child: Text(
                        //         "Buy Now",
                        //         style: TextStyle(
                        //             fontFamily: "poppins",
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.black),
                        //       ),
                        //     ),
                        //     Container(
                        //       //buy now icon
                        //       child: IconButton(
                        //         icon: Icon(Icons.account_balance_wallet_rounded,
                        //             color: Colors.black),
                        //         onPressed: () {
                        //           paynow();
                        //         },
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
