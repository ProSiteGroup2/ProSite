import 'package:flutter/material.dart';
import 'package:group2/Classes/order_methods.dart';

import '../common/size.dart';
import '../globals.dart';

class HdActivities extends StatefulWidget {
  const HdActivities({Key? key}) : super(key: key);

  @override
  State<HdActivities> createState() => _HdActivitiesState();
}

class _HdActivitiesState extends State<HdActivities> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    gettingHardwareOrders();
    super.initState();
  }

  List orders=[];
  List buyer_name=[];
  List buyer_contact=[];
  String alert_text='';


  Future<void> gettingHardwareOrders() async{
    var result=await OrderMethods().getHardwareOrders(sp['_id']);
    if(result.data['success']){
      setState(() {
        orders=result.data['orders'];
      });
      if(orders.isNotEmpty){
        for(var i=0;i<orders.length;i++){
          if(orders[i]['buyer_consumer']!=null){
            buyer_name.add(orders[i]['buyer_consumer']['username']);
            buyer_contact.add(orders[i]['buyer_consumer']['contactNo']);
          }else if(orders[i]['buyer_labour']!=null){
            buyer_name.add(orders[i]['buyer_labour']['username']);
            buyer_contact.add(orders[i]['buyer_labour']['contactNo']);
          }else if(orders[i]['buyer_contractor']!=null){
            buyer_name.add(orders[i]['buyer_contractor']['contractorname']);
            buyer_contact.add(orders[i]['buyer_contractor']['contactNo']);
          }else{
            buyer_name.add(orders[i]['buyer_transporter']['username']);
            buyer_contact.add(orders[i]['buyer_transporter']['contactNo']);
          }
        }
      }else{
        alert_text='No orders found';
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0, bottom: 20.0),
                  child: Text('Purchase Activities',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0
                    ),
                  ),
                ),),
              SizedBox(height: 20.0,),
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                width: kPropWidth(context, 1) ,
                height:550,
                child: alert_text!=''?Center(child:Text(alert_text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)): orders.isEmpty?Center(child: CircularProgressIndicator()): ListView.builder(

                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemCount: orders.length,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        width: 250,
                        height: 170,

                        // margin: EdgeInsets.only( right:20,top: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //  border: Border.all(width: 2, color: Colors.grey.shade200),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              spreadRadius: 10,
                              blurRadius: 7,
                              offset: const Offset(2, 5), // changes position of shadow
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.8),
                              spreadRadius: 10,
                              blurRadius: 7,

                              offset: const Offset(-10, -10), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ElevatedButton(

                          onPressed: () {},
                          style: ElevatedButton.styleFrom(

                            primary: Colors.white,
                            shadowColor: Colors.grey.withOpacity(0.25),
                            padding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),

                          child: Row(
                            children: [
                              Expanded(
                                flex:2,
                                child: Container(
                                  //image
                                  width: 100,
                                  height: 95,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image:NetworkImage('${orders[i]['item']['imageUrl']}'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5,),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${orders[i]['item']['productname']}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(height: 5.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Qty: ${orders[i]['quantity']}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0
                                        ),),
                                        SizedBox(width: 10.0,),
                                        Row(
                                          children: [
                                            Text('Price: ',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              color: Colors.black
                                            ),),
                                            Text('Rs.${orders[i]['amount']}',
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                                fontWeight: FontWeight.bold,
                                              fontSize: 18.0
                                            ),)
                                          ],
                                        ),

                                      ],
                                    ),
                                    SizedBox(height: 5.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Order ID: ',
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          ),),
                                        Text('${orders[i]['_id']}',
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red
                                          ),),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Buyer: ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          ),),
                                        Text('${buyer_name[i]}',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.purpleAccent
                                          ),),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Buyer ContactNo: ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          ),),
                                        Text('${buyer_contact[i]}',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.purpleAccent
                                          ),),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Date: ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          ),),
                                        Text('${orders[i]['createdAt'].toString().substring(0,10)}',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.purpleAccent
                                          ),),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );

                    }),
              )

            ],
          ),
        ),
      ),
    );
  }
}
