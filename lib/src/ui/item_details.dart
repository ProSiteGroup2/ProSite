// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last


import 'package:flutter/material.dart';
import 'package:group2/common/size.dart';
import 'package:group2/pages/addcart.dart';
import 'package:group2/pages/customer_spprofileview.dart';
import 'package:group2/pages/paynow.dart';
import 'package:group2/pages/user_profile.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
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
                    image: AssetImage("assets/imgs/logo.png"),
                    fit: BoxFit.cover,
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
                    Text("Safety Goggles",
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            height: 2)),
                    Container(
                      //price
                      width: kPropWidth(context, 0.22),
                      height: kPropHeight(context, 0.035),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blue[700]!.withOpacity(0.4),
                      ),
                      child: Text(
                        "Rs.1000",
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w500,
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
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins"),
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(text: "Details"),
                      Tab(text: "Specifications"),
                      Tab(text: "Reviews"),
                      Tab(text: "About Seller")
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      //details tab
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Container(
                            //details tab details
                            width: kPropWidth(context, 1) - 32,
                            //height: kPropHeight(context, 0.4) - 32,
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 15),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi maximus hendrerit odio, eu iaculis orci rutrum et. Vestibulum ex orci, semper lobortis lacus sit amet, vehicula porttitor felis.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                  height: 1.15),
                            ),
                          ),
                          Container(
                            //blue clr link
                            margin: EdgeInsets.only(left: 22, right: 15),
                            alignment: Alignment.topLeft,
                            child: InkWell(
                                child: Text(
                                  'See full description . . .',
                                  style: TextStyle(
                                    fontFamily: "poppins",
                                    color: Colors.blue[800],
                                  ),
                                ),
                                onTap: () =>
                                    launch('https://www.youtube.com/')),
                          )
                        ],
                      ),
                    ),
                    Container(
                      //specifications tab
                      margin: EdgeInsets.only(top: 15),
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
                                    "Condition  -",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: "poppins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        wordSpacing: 0.5,
                                        letterSpacing: 0.8,
                                        height: 1.15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Quantity  -",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: "poppins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        wordSpacing: 0.5,
                                        letterSpacing: 0.8,
                                        height: 1.15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Model  -",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: "poppins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        wordSpacing: 0.5,
                                        letterSpacing: 0.8,
                                        height: 1.15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 22, right: 15),
                            alignment: Alignment.topLeft,
                            child: InkWell(
                                child: Text(
                                  'For more . . .',
                                  style: TextStyle(
                                    fontFamily: "poppins",
                                    color: Colors.blue[800],
                                  ),
                                ),
                                onTap: () =>
                                    launch('https://www.youtube.com/')),
                          )
                        ],
                      ),
                    ),
                    Container(
                      //details tab
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          // Container(
                          //     //Review title
                          //         margin: EdgeInsets.only(left: 30, top: 10),
                          //         child: Column(
                          //           children: [
                          //             Container(
                          //               width: kPropWidth(context, 1) - 32,
                          //               height: kPropHeight(context, 0.1) - 32,
                          //               child: Text(
                          //                 "Reviews",
                          //                 textAlign: TextAlign.left,
                          //                 style: TextStyle(
                          //                     fontFamily: "poppins",
                          //                     fontSize: 14,
                          //                     fontWeight: FontWeight.bold,
                          //                     height: 1.15),
                          //               ),
                          //             ),
                          //             ],
                          //         ),
                          //     ),
                          Container(
                            //details tab details
                            width: kPropWidth(context, 1) - 32,
                            //height: kPropHeight(context, 0.4) - 32,
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                  height: 1.15),
                            ),
                          ),
                          Container(
                            //blue clr link
                            margin: EdgeInsets.only(left: 22, right: 15),
                            alignment: Alignment.topLeft,
                            child: InkWell(
                                child: Text(
                                  'See more . . .',
                                  style: TextStyle(
                                    fontFamily: "poppins",
                                    color: Colors.blue[800],
                                  ),
                                ),
                                onTap: () =>
                                    launch('https://www.youtube.com/')),
                          )
                        ],
                      ),
                    ),
                    Container(
                      //about seller tab
                      margin: EdgeInsets.only(left: 30, top: 18),
                      child: Column(
                        children: [
                          Container(
                            //about title
                            width: kPropWidth(context, 1) - 32,
                            height: kPropHeight(context, 0.1) - 32,
                            child: Text(
                              "About",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  height: 1.15),
                            ),
                          ),
                          Container(
                            //about content
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    //seller icon
                                          margin: const EdgeInsets.fromLTRB(0, 0, 2, 20),
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
                                              image: AssetImage("assets/imgs/self.jpg"),
                                              fit: BoxFit.cover,     
                                              ),
                                        ),

                                        
                                    ),
                                Container(
                                  //seller details
                                   margin: const EdgeInsets.fromLTRB(0, 0, 20, 20),
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Customerspview()),
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
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        
                                        Container(
                                          //details of a item
                                          margin:
                                              const EdgeInsets.only(top: 20),
                                           width: kPropWidth(context, 0.4),
                                           height: kPropHeight(context, 0.1),
                                          child: Column(
                                            
                                            children: [
                                              Container(
                                                child: const Text(
                                                  "Abc Company",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontFamily: "poppins",
                                                      fontSize: 14,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.15),
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                margin: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                                                padding: const EdgeInsets.only(
                                                    left: 2.0, right: 2),
                                                child: Text("View Profile", style: TextStyle(fontFamily: "Poppins",color: Colors.grey),),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black,),
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
                              spreadRadius: 10,
                              blurRadius: 7,
                              offset:
                                  Offset(2, 5), // changes position of shadow
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.8),
                              spreadRadius: 10,
                              blurRadius: 7,
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => paynow()),
                                      );
                                      
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    label: const Text("Buy Now",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black),), 
                                      icon: Icon(Icons.account_balance_wallet_rounded,color:Colors.black ,size: 20,) ,
                                    
                                   
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
                    //   Container(
                    //     //add to cart
                    //     width: kPropWidth(context, 0.37),
                    //     height: kPropHeight(context, 0.06),
                    //     margin: EdgeInsets.only(left: 10),
                    //     padding: EdgeInsets.only(right: 5, left: 5),
                    //     decoration: BoxDecoration(
                    //       color: Colors.cyan[300],
                    //       borderRadius: BorderRadius.circular(10),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.25),
                    //           spreadRadius: 10,
                    //           blurRadius: 7,
                    //           offset:
                    //               Offset(2, 5), // changes position of shadow
                    //         ),
                    //         BoxShadow(
                    //           color: Colors.white.withOpacity(0.8),
                    //           spreadRadius: 10,
                    //           blurRadius: 7,
                    //           offset: Offset(
                    //               -10, -10), // changes position of shadow
                    //         ),
                    //       ],
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         Container(
                    //           //add cart text
                    //           alignment: Alignment.centerRight,
                    //           child: Text(
                    //             "Add to Cart",
                    //             style: TextStyle(
                    //                 fontFamily: "poppins",
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Colors.black),
                    //           ),
                    //         ),
                    //         Container(
                    //           //add cart icon
                    //           child: IconButton(
                    //             icon: Icon(Icons.shopping_bag_rounded,
                    //                 color: Colors.black),
                    //             onPressed: () {
                    //               print("add to cart");
                    //             },
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // 
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
                              spreadRadius: 10,
                              blurRadius: 7,
                              offset:
                                  Offset(2, 5), // changes position of shadow
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.8),
                              spreadRadius: 10,
                              blurRadius: 7,
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => addcart()),
                                      );
                                      
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.cyan[300],
                                      
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    label: const Text("Add to Cart",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black),), 
                                      icon: Icon(Icons.shopping_bag_rounded,color:Colors.black,size: 20,) ,
                                    
                                   
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
