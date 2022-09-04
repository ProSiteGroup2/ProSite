// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors, avoid_print, unused_import, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/product_methods.dart';
import 'package:group2/Classes/service_provider_methods.dart';
import 'package:group2/common/size.dart';
import 'package:group2/components/image_causerol.dart';
import 'package:group2/components/image_causerol_a.dart';
import 'package:group2/components/image_causerol_cont.dart';
import 'package:group2/components/image_causerol_lab.dart';
import 'package:group2/components/image_causerol_trans.dart';
import 'package:group2/globals.dart';
import 'package:group2/pages/about_setting.dart';
import 'package:group2/pages/loginas_cons.dart';
import 'package:group2/pages/loginpage.dart';
import 'package:group2/src/ui/Bricks.dart';
import 'package:group2/src/ui/Cement.dart';
import 'package:group2/src/ui/Sand.dart';
import 'package:group2/src/ui/Steel.dart';
import 'package:group2/src/ui/Suggestion.dart';
import 'package:group2/src/ui/item_details.dart';
import 'package:group2/src/ui/user_api.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Future<List<dynamic>?> gettingTransporters() async {
    var results=await SPMethods().getTransporters();
    if(results.data['success']){
      return results.data['transporters'];
    } else {
      Fluttertoast.showToast(
          msg: results.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<List<dynamic>?> gettingContractors() async {
    var results = await SPMethods().getContractors();
    if (results.data['success']) {
      return results.data['contractors'];
    } else {
      Fluttertoast.showToast(
          msg: results.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<List<dynamic>?> gettingLabours() async {
    var results = await SPMethods().getLabours();
    if (results.data['success']) {
      return results.data['labours'];
    } else {
      Fluttertoast.showToast(
          msg: results.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<List<dynamic>?> gettingMasons() async {
    var results = await SPMethods().getMason();
    if (results.data['success']) {
      return results.data['masons'];
    } else {
      Fluttertoast.showToast(
          msg: results.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<List<dynamic>?> gettingElectricians() async {
    var results = await SPMethods().getElectrician();
    if (results.data['success']) {
      return results.data['electricians'];
    } else {
      Fluttertoast.showToast(
          msg: results.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<List<dynamic>?> gettingPlumbers() async {
    var results = await SPMethods().getPlumber();
    if (results.data['success']) {
      return results.data['plumbers'];
    } else {
      Fluttertoast.showToast(
          msg: results.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<List<dynamic>?> gettingArchitecturers() async {
    var results = await SPMethods().getArchitecturer();
    if (results.data['success']) {
      return results.data['architecturers'];
    } else {
      Fluttertoast.showToast(
          msg: results.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<List<dynamic>?> gettingCarpenters() async {
    var results = await SPMethods().getCarpenter();
    if (results.data['success']) {
      return results.data['carpenters'];
    } else {
      Fluttertoast.showToast(
          msg: results.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<List<dynamic>?> gettingPainters() async {
    var results = await SPMethods().getPainter();
    if (results.data['success']) {
      return results.data['painters'];
    } else {
      Fluttertoast.showToast(
          msg: results.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<List<dynamic>?> gettingProducts() async {
    var results = await ProductMethods().getProducts();
    if (results.data['success']) {
      return results.data['products'];
    } else {
      Fluttertoast.showToast(
          msg: results.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Map<String, dynamic> data = {
    "isRegisted": true,
    "tags": [
      {
        "image": 'assets/imgs/brush.jpg',
        "name": "Brush",
        "hardware": "Perera Hardware, Maharagama",
        "brand": "Fine Brsuh",
        "discount": "5%",
      },
      {
        "image": 'assets/imgs/stee.jpg',
        "name": "Steel",
        "hardware": "Rathna Hardware, Dehiwala",
        "brand": "Melwa Steel",
        "discount": "15%",
      },
      {
        "image": 'assets/imgs/cement.jpg',
        "name": "Cement1",
        "hardware": "Balaji Hardware, Colombo-06",
        "brand": "Lanwa Cement",
        "discount": "10% ",
      },
      {
        "image": 'assets/imgs/cement.png',
        "name": "Cement2",
        "hardware": "ANC Hardware, Matara",
        "brand": "Sanstha Cement",
        "discount": "10% ",
      },
      {
        "image": 'assets/imgs/logo.png',
        "name": "Logo",
        "hardware": "S & S Hardware, Mount Lavinia",
        "brand": "Mascot Logo",
        "discount": "20%",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _typeAheadController = TextEditingController();
    TabController _tabController = TabController(length: 2, vsync: this);
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: const Color(0xE5E5E5),
            elevation: 0,
            actions: [
              PopupMenuButton(
                  // add icon, by default "3 dot" icon
                  icon: Icon(
                    Icons.menu_rounded,
                    color: Colors.black87,
                    size: 28,
                  ),
                  // position: ,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Text("About"),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Text("Logout"),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    if (value == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => About()),
                      );
                    } else if (value == 1) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/ConsumerLogin', (route) => false);
                    }
                  }),
            ],
            leading: Container(
              margin: const EdgeInsets.only(left: 18, top: 12, bottom: 10),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/imgs/logo.png'),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(kPropHeight(context, 0.2)),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                          left: 10, top: 5, right: 200, bottom: 10),
                      child: const Text(
                        "Find Your\nNeed",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            height: 1.15),
                      )),
                  const TabBar(
                    labelPadding: EdgeInsets.only(left: 40, right: 40),
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [Tab(text: "Hardware Items"), Tab(text: "Workers")],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            //tabbarview
            children: [
              Container(
                //products
                width: kPropWidth(context, 1),
                height: kPropHeight(context, 1),
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        child: TypeAheadField<User?>(
                          hideSuggestionsOnKeyboardHide: true,
                          textFieldConfiguration: TextFieldConfiguration(
                              autofocus: false,
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .copyWith(fontStyle: FontStyle.italic),
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.search_rounded),
                                contentPadding:
                                    const EdgeInsets.only(right: 15, left: 18),
                                fillColor: Colors.white,
                                filled: true,
                                
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    
                                    borderSide: BorderSide.none),
                                    
                                hintText: 'Search Item...',
                                hintStyle: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.grey,
                                    fontSize: 18),
                              )),
                          suggestionsCallback: UserApi.getProductSuggestions,
                          itemBuilder: (context, User? suggestion) {
                            final user = suggestion!;
                            return ListTile(
                              leading: Image.network(
                                user.imageUrl,
                              ),
                              title: Text(
                                user.productname,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Rs.' + '${user.price}'),
                            );
                          },
                          noItemsFoundBuilder: (context) => Container(
                            height: 100,
                            child: Center(
                              child: Text(
                                'No Users Found.',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          onSuggestionSelected: (User? suggestion) {
                            User user = suggestion!;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Suggestions_det(user: user)),
                            );
                           
                          },
                        ),
                      ),
                      // Container(
                      //   //search
                      //   margin: const EdgeInsets.all(20),
                      //   child: Container(
                      //     padding: const EdgeInsets.only(right: 5, left: 5),
                      //     child: Row(
                      //       children: [
                      //         Flexible(
                      //           flex: 1,
                      //           child: TextField(
                      //             style: const TextStyle(height: 0.5),
                      //             cursorColor: Colors.grey,
                      //             decoration: InputDecoration(
                      //               contentPadding: const EdgeInsets.only(
                      //                   right: 15, left: 18),
                      //               fillColor: Colors.white,
                      //               filled: true,
                      //               border: OutlineInputBorder(
                      //                   borderRadius: BorderRadius.circular(15),
                      //                   borderSide: BorderSide.none),
                      //               hintText: 'Search Item...',
                      //               hintStyle: const TextStyle(
                      //                   fontFamily: 'Poppins',
                      //                   color: Colors.grey,
                      //                   fontSize: 16),
                      //             ),
                      //           ),
                      //         ),
                      //         Container(
                      //           margin: const EdgeInsets.only(left: 10),
                      //           padding:
                      //               const EdgeInsets.only(right: 5, left: 5),
                      //           decoration: BoxDecoration(
                      //               color: Theme.of(context).primaryColor,
                      //               borderRadius: BorderRadius.circular(15)),
                      //           child: IconButton(
                      //             icon: const Icon(Icons.search,
                      //                 color: Colors.white),
                      //             onPressed: () async {
                      //               await ProductMethods()
                      //                   .getProducts()
                      //                   .then((val) {
                      //                 if (val.data['success']) {
                      //                   data['_userList'] =
                      //                       val.data['products'];
                      //                 } else {
                      //                   Fluttertoast.showToast(
                      //                       msg: val.data['msg'],
                      //                       toastLength: Toast.LENGTH_SHORT,
                      //                       gravity: ToastGravity.BOTTOM,
                      //                       backgroundColor: Colors.red,
                      //                       textColor: Colors.white,
                      //                       fontSize: 16.0);
                      //                 }
                      //               });
                      //             },
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Container(
                        //Categories
                        child: Column(
                          children: [
                            Container(
                              //category title
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 11.0, horizontal: 25.0),
                                      child: const Text(
                                        "Categories",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            height: 1.15),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    //row1
                                    child: Row(
                                      children: [
                                        Container(
                                          //Cement
                                          margin: const EdgeInsets.fromLTRB(
                                              25, 10, 10, 15),
                                          width: kPropWidth(context, 0.4),
                                          height: kPropHeight(context, 0.08),

                                          // margin: EdgeInsets.only( right:20,top: 15),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            //  border: Border.all(width: 2, color: Colors.grey.shade200),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.25),
                                                spreadRadius: 10,
                                                blurRadius: 7,
                                                offset: const Offset(2,
                                                    5), // changes position of shadow
                                              ),
                                              BoxShadow(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                spreadRadius: 10,
                                                blurRadius: 7,
                                                offset: const Offset(-10,
                                                    -10), // changes position of shadow
                                              ),
                                            ],
                                          ),

                                          child: Container(
                                            //cement
                                            width: kPropWidth(context, 0.4),
                                            height: kPropHeight(context, 0.08),
                                            decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/imgs/cement.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),

                                            child: ElevatedButton(
                                              onPressed: () async {
                                                await ProductMethods()
                                                    .getCementProduct()
                                                    .then((val) {
                                                  if (val.data['success']) {
                                                    data['tags'] =
                                                        val.data['products'];
                                                  } else {
                                                    Fluttertoast.showToast(
                                                        msg: val.data['msg'],
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  }
                                                });
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          cement(
                                                            context: context,
                                                            tags: data['tags'],
                                                          )),
                                                );
                                              },
                                              child: const Text(
                                                "Cement",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                    color: Colors.white),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.white12,
                                                // shadowColor: Colors. transparent,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 0.0,
                                                        horizontal: 0.0),

                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          //Bricks
                                          margin: const EdgeInsets.fromLTRB(
                                              12, 10, 22, 15),
                                          width: kPropWidth(context, 0.4),
                                          height: kPropHeight(context, 0.08),

                                          // margin: EdgeInsets.only( right:20,top: 15),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            //  border: Border.all(width: 2, color: Colors.grey.shade200),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.25),
                                                spreadRadius: 10,
                                                blurRadius: 7,
                                                offset: const Offset(2,
                                                    5), // changes position of shadow
                                              ),
                                              BoxShadow(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                spreadRadius: 10,
                                                blurRadius: 7,
                                                offset: const Offset(-10,
                                                    -10), // changes position of shadow
                                              ),
                                            ],
                                          ),

                                          child: Container(
                                            //bricks
                                            width: kPropWidth(context, 0.4),
                                            height: kPropHeight(context, 0.08),
                                            decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/imgs/bricks.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                await ProductMethods()
                                                    .getBricksProduct()
                                                    .then((val) {
                                                  if (val.data['success']) {
                                                    data['tags'] =
                                                        val.data['products'];
                                                  } else {
                                                    Fluttertoast.showToast(
                                                        msg: val.data['msg'],
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  }
                                                });
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          brick(
                                                            context: context,
                                                            tags: data['tags'],
                                                          )),
                                                );
                                              },
                                              child: const Text(
                                                "Bricks",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                    color: Colors.white),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.white12,
                                                // shadowColor: Colors. transparent,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 0.0,
                                                        horizontal: 0.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    //row2
                                    child: Row(
                                      children: [
                                        Container(
                                          //steel
                                          margin: const EdgeInsets.fromLTRB(
                                              25, 15, 10, 20),
                                          width: kPropWidth(context, 0.4),
                                          height: kPropHeight(context, 0.08),

                                          // margin: EdgeInsets.only( right:20,top: 15),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            //  border: Border.all(width: 2, color: Colors.grey.shade200),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.25),
                                                spreadRadius: 10,
                                                blurRadius: 7,
                                                offset: const Offset(2,
                                                    5), // changes position of shadow
                                              ),
                                              BoxShadow(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                spreadRadius: 10,
                                                blurRadius: 7,
                                                offset: const Offset(-10,
                                                    -10), // changes position of shadow
                                              ),
                                            ],
                                          ),

                                          child: Container(
                                            //steel
                                            width: kPropWidth(context, 0.4),
                                            height: kPropHeight(context, 0.08),
                                            decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/imgs/stee.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                await ProductMethods()
                                                    .getSteelProduct()
                                                    .then((val) {
                                                  if (val.data['success']) {
                                                    data['tags'] =
                                                        val.data['products'];
                                                  } else {
                                                    Fluttertoast.showToast(
                                                        msg: val.data['msg'],
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  }
                                                });
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          steel(
                                                            context: context,
                                                            tags: data['tags'],
                                                          )),
                                                );
                                              },
                                              child: const Text(
                                                "Steel",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                    color: Colors.white),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.white12,
                                                shadowColor: Colors.transparent,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 0.0,
                                                        horizontal: 0.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          //sand
                                          margin: const EdgeInsets.fromLTRB(
                                              12, 15, 22, 20),
                                          width: kPropWidth(context, 0.4),
                                          height: kPropHeight(context, 0.08),

                                          // margin: EdgeInsets.only( right:20,top: 15),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            //  border: Border.all(width: 2, color: Colors.grey.shade200),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.25),
                                                spreadRadius: 10,
                                                blurRadius: 7,
                                                offset: const Offset(2,
                                                    5), // changes position of shadow
                                              ),
                                              BoxShadow(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                spreadRadius: 10,
                                                blurRadius: 7,
                                                offset: const Offset(-10,
                                                    -10), // changes position of shadow
                                              ),
                                            ],
                                          ),

                                          child: Container(
                                            //sand
                                            width: kPropWidth(context, 0.4),
                                            height: kPropHeight(context, 0.08),
                                            decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/imgs/sand.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                await ProductMethods()
                                                    .getSandProduct()
                                                    .then((val) {
                                                  if (val.data['success']) {
                                                    data['tags'] =
                                                        val.data['products'];
                                                  } else {
                                                    Fluttertoast.showToast(
                                                        msg: val.data['msg'],
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  }
                                                });
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          sand(
                                                            context: context,
                                                            tags: data['tags'],
                                                          )),
                                                );
                                              },
                                              child: const Text(
                                                "Sand",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                    color: Colors.white),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.white10,
                                                // shadowColor: Colors. transparent,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 0.0,
                                                        horizontal: 0.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //most pop
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 11.0, horizontal: 25.0),
                                      child: const Text(
                                        "Most Popular Items",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            height: 1.15),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              child: ImageCauserol(
                                tags: data['tags'],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //this week best offers
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 11.0, horizontal: 25.0),
                                      child: const Text(
                                        "This Week best offers",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            height: 1.15),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              child: ImageCauserol_a(
                                context: context,
                                tags: data['tags'],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                //workers
                width: kPropWidth(context, 1),
                height: kPropHeight(context, 1),
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Container(
                      //   child: Container(
                      //     margin: const EdgeInsets.all(20),
                      //     //search content
                      //     padding: const EdgeInsets.only(right: 5, left: 5),
                      //     child: Row(
                      //       children: [
                      //         Flexible(
                      //           // TEXTFIELD
                      //           flex: 1,
                      //           child: TextField(
                      //             style: const TextStyle(height: 0.5),
                      //             cursorColor: Colors.grey,
                      //             decoration: InputDecoration(
                      //               contentPadding: const EdgeInsets.only(
                      //                   right: 15, left: 18),
                      //               fillColor: Colors.white,
                      //               filled: true,
                      //               border: OutlineInputBorder(
                      //                   borderRadius: BorderRadius.circular(15),
                      //                   borderSide: BorderSide.none),
                      //               hintText: 'Search Category...',
                      //               hintStyle: const TextStyle(
                      //                   fontFamily: 'Poppins',
                      //                   color: Colors.grey,
                      //                   fontSize: 16),
                      //             ),
                      //           ),
                      //         ),
                      //         Container(
                      //           //search button
                      //           margin: const EdgeInsets.only(left: 10),
                      //           padding:
                      //               const EdgeInsets.only(right: 5, left: 5),
                      //           decoration: BoxDecoration(
                      //               color: Theme.of(context).primaryColor,
                      //               borderRadius: BorderRadius.circular(15)),
                      //           child: IconButton(
                      //             icon: const Icon(Icons.search,
                      //                 color: Colors.white),
                      //             onPressed: () {
                      //               print("b");
                      //             },
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Container(
                        //constructor
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //constructor carousal name
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 25.0),
                                child: const Text(
                                  "Contractors",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      height: 1.15),
                                ),
                              ),
                            ]),
                      ),
                      Container(
                          //constructor car
                          child: FutureBuilder<List<dynamic>?>(
                        future: gettingContractors(),
                        builder:
                            (context, AsyncSnapshot<List<dynamic>?> snapshot) {
                          if (snapshot.hasData) {
                            return ImageCauserol_cont(
                              tags: snapshot.data!,
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      )),
                      Container(
                        //mason
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //mason carousals name
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 25.0),
                                      child: const Text(
                                        "Labours",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            height: 1.15),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: const Text(
                                        "See all",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            height: 1),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                                //labours carousals
                                child: FutureBuilder<List<dynamic>?>(
                              future: gettingLabours(),
                              builder: (context,
                                  AsyncSnapshot<List<dynamic>?> snapshot) {
                                if (snapshot.hasData) {
                                  return ImageCauserol_lab(
                                    tags: snapshot.data!,
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            )),
                          ],
                        ),
                      ),
                      Container(
                        //elec
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //Electrians carousals name
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 25.0),
                                      child: const Text(
                                        "Transporters",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            height: 1.15),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                                //transporters carousals
                                child: FutureBuilder<List<dynamic>?>(
                              future: gettingTransporters(),
                              builder: (context,
                                  AsyncSnapshot<List<dynamic>?> snapshot) {
                                if (snapshot.hasData) {
                                  return ImageCauserol_trans(
                                    tags: snapshot.data!,
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            )),
                          ],
                        ),
                      ),
                      Container(
                        //Masons
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //mason carousals name
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 25.0),
                                      child: const Text(
                                        "Masons",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            height: 1.15),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              //mason carousals
                              child: FutureBuilder<List<dynamic>?>(
                                future: gettingMasons(),
                                builder: (context,
                                    AsyncSnapshot<List<dynamic>?> snapshot) {
                                  if (snapshot.hasData) {
                                    return ImageCauserol_lab(
                                      tags: snapshot.data!,
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //Electricians
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //electrician carousals name
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 25.0),
                                      child: const Text(
                                        "Electricians",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            height: 1.15),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              //electrician carousals
                              child: FutureBuilder<List<dynamic>?>(
                                future: gettingElectricians(),
                                builder: (context,
                                    AsyncSnapshot<List<dynamic>?> snapshot) {
                                  if (snapshot.hasData) {
                                    return ImageCauserol_lab(
                                      tags: snapshot.data!,
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //Plumbers
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //plumbers carousals name
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 25.0),
                                      child: const Text(
                                        "Plumbers",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            height: 1.15),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              //plumbers carousals
                              child: FutureBuilder<List<dynamic>?>(
                                future: gettingPlumbers(),
                                builder: (context,
                                    AsyncSnapshot<List<dynamic>?> snapshot) {
                                  if (snapshot.hasData) {
                                    return ImageCauserol_lab(
                                      tags: snapshot.data!,
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //Architecturer
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //Architecturer carousals name
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 25.0),
                                      child: const Text(
                                        "Architecturers",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            height: 1.15),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              //Architecturer carousals
                              child: FutureBuilder<List<dynamic>?>(
                                future: gettingArchitecturers(),
                                builder: (context,
                                    AsyncSnapshot<List<dynamic>?> snapshot) {
                                  if (snapshot.hasData) {
                                    return ImageCauserol_lab(
                                      tags: snapshot.data!,
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //Carpenter
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //Carpenter carousals name
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 25.0),
                                      child: const Text(
                                        "Carpenters",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            height: 1.15),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              //Carpenter carousals
                              child: FutureBuilder<List<dynamic>?>(
                                future: gettingCarpenters(),
                                builder: (context,
                                    AsyncSnapshot<List<dynamic>?> snapshot) {
                                  if (snapshot.hasData) {
                                    return ImageCauserol_lab(
                                      tags: snapshot.data!,
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //Painter
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //Painter carousals name
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 25.0),
                                      child: const Text(
                                        "Painters",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            height: 1.15),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              //Painter carousals
                              child: FutureBuilder<List<dynamic>?>(
                                future: gettingPainters(),
                                builder: (context,
                                    AsyncSnapshot<List<dynamic>?> snapshot) {
                                  if (snapshot.hasData) {
                                    return ImageCauserol_lab(
                                      tags: snapshot.data!,
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
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
