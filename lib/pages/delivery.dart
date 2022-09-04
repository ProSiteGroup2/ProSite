import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/service_provider_methods.dart';

import '../common/size.dart';
import '../globals.dart';
import 'customer_transporterview.dart';

class delivery extends StatefulWidget {
  const delivery({Key? key}) : super(key: key);

  @override
  State<delivery> createState() => _deliveryState();
}

class _deliveryState extends State<delivery> {

  final ScrollController _scrollController = ScrollController();

  List transporters=[];
  String alert_text='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingTransporters();
  }

  gettingTransporters() async {
    try {
      var result=await SPMethods().getTransporters();
      if(result.data['success']){
        setState(() {
          transporters=result.data['transporters'];
        });
        if(transporters.isEmpty){
          alert_text='No Transporters Available';
        }
        print(transporters);
      }else{
        Fluttertoast.showToast(
            msg:result.data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(
          msg:'An Error occured',
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
        elevation: 0,
        title: Text('Select a Transporter',
          style: TextStyle(fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'),),
        centerTitle: true,
        backgroundColor: Color(0xFFB1E1FF),
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(

                margin: EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                width: kPropWidth(context, 1) ,
                height:550,
                child: alert_text!=''?Center(child:Text(alert_text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)): transporters.isEmpty?Center(child: CircularProgressIndicator()): ListView.builder(

                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemCount: transporters.length,
                    itemBuilder: (context, i) {
                      return Container(

                        margin: const EdgeInsets.all(10),
                        width: 250,
                        height: 100,

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

                          onPressed: () {
                            sp=transporters[i];
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cstransporterview()));
                          },
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
                                  alignment: Alignment.centerLeft,
                                  width: 100,
                                  height: 95,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: transporters[i]['imageUrl']!=null?NetworkImage("${transporters[i]['imageUrl']}"):AssetImage('assets/imgs/profile.jpg')as ImageProvider,
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
                                    SizedBox(height: 5.0,),
                                    Text(transporters[i]['username'],
                                      style: TextStyle(
                                          fontFamily: "poppins",
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          height: 1.15),),
                                    SizedBox(height: 3.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.directions_car,
                                          size: 20,
                                          color: Colors.blue,),
                                        SizedBox(width: 3.0,),
                                        Text(transporters[i]['vehicle'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16
                                          ),),
                                      ],
                                    ),
                                    SizedBox(height: 3.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_on,size: 13.0,color: Colors.red,),
                                        SizedBox(width: 3.0,),
                                        Text(
                                          "${transporters[i]['hometown']}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13),
                                          maxLines:3,
                                          softWrap: false,
                                        )
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
              ),
            ],
          ),
        ),
      ));
  }
}
