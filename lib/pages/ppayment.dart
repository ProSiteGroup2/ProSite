// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/service_provider_methods.dart';
import 'package:group2/common/size.dart';
import 'package:group2/components/image_causerol_id.dart';
import 'package:group2/pages/delivery.dart';

class ppayment extends StatefulWidget {
  const ppayment({Key? key}) : super(key: key);

  @override
  State<ppayment> createState() => _ppaymentState();
}

class _ppaymentState extends State<ppayment> {

late String preActivities;

  Future<List<dynamic>?> gettingOrders() async {
    var results = await SPMethods().getOrders();
    if (results.data['success']) {
      setState(() {
        preActivities = results.data['orders'];
      });
      // return results.data['orders'];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: kPropWidth(context, 0.2),
                height: kPropHeight(context, 0.10),
                margin: EdgeInsets.fromLTRB(160, 20, 160, 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/imgs/tick.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              Container(
                width: kPropWidth(context, 1),
                height: kPropHeight(context, 0.10),
                margin: EdgeInsets.fromLTRB(60, 10, 40, 10),
                child: Text(
                  "Order Placed Successfully!",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromARGB(255, 27, 89, 118),
                  ),
                ),
              ),
              Container(
                child: Row(
                  //order id
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: kPropWidth(context, 0.5),
                      height: kPropHeight(context, 0.05),
                      margin: EdgeInsets.fromLTRB(80, 5, 0, 30),
                      child: Text(
                        "Your Order ID :",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blueGrey[400],
                        ),
                      ),
                    ),
                    Container(
                        width: kPropWidth(context, 0.3),
                        height: kPropHeight(context, 0.05),
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 30),
                         child: Text("ID",
                        style: TextStyle(
                          fontFamily: "Poppins",

                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.blueGrey[900],
                        ),),
                        // child: FutureBuilder<List<dynamic>?>(
                        //   future: gettingOrders(),
                        //   builder: (context,
                        //       AsyncSnapshot<List<dynamic>?> snapshot) {
                        //     if (snapshot.hasData) {
                        //       return Text("ID ",
                        //           style: TextStyle(
                        //             fontFamily: "Poppins",

                        //                       fontWeight: FontWeight.bold,
                        //                       fontSize: 16,
                        //                       color: Colors.blueGrey[900],
                        //           ),)
                        //           ;
                        //       // ImageCauserol_cont_id(
                        //       //   tags: snapshot.data!,
                        //       // );
                              
                        //     } else {
                        //       return CircularProgressIndicator();
                        //     }
                        //   },
                        // )
                        //
                        )
                  ],
                ),
              ),
              Container(
                width: kPropWidth(context, 1),
                height: kPropHeight(context, 0.05),
                margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Text(
                  "If You want a Delivery Service Click Below... ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Container(
                //find vehicle
                width: kPropWidth(context, 0.5),
                height: kPropHeight(context, 0.06),
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(right: 5, left: 5, bottom: 5),
                decoration: BoxDecoration(
                  // color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: Offset(2, 5), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: Offset(-10, -10), // changes position of shadow
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
                        MaterialPageRoute(builder: (context) => delivery()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    label: const Text(
                      "Find Transporter",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.directions_car,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
              Container(
                width: kPropWidth(context, 1),
                height: kPropHeight(context, 0.3),
                margin: EdgeInsets.fromLTRB(50, 20, 50, 100),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/imgs/ordsuccess.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
