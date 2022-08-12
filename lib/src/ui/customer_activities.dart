import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/authenticate_service.dart';
import 'package:group2/Classes/customer_pre_activities.dart';
import 'package:group2/Classes/service_provider_methods.dart';
import 'package:group2/globals.dart';
import 'package:group2/pages/customer_contractorview.dart';
import 'package:group2/pages/customer_labourpview.dart';
import 'package:group2/pages/customer_transporterview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Classes/my_flutter_app_icons.dart';


class CActivity extends StatefulWidget {
  const CActivity({Key? key}) : super(key: key);

  @override
  _CActivityState createState() => _CActivityState();
}

class _CActivityState extends State<CActivity> {

  @override
  List preActivities = [
    PreAct('worker1.jpg', 'hell', '2022-11-3'),
    PreAct('worker2.jpg', 'Hi', '2022-09-3'),
    PreAct('worker3.jpg', 'Wanda', '2022-06-3'),
    PreAct('worker2.jpg', 'Hi', '2022-09-3'),
  ];

  List upActivities=[];


  @override
  void initState() {
    gettingConsumerPastAppointments();
    gettingConsumerUpcomingAppointments();
    super.initState();

  }


  List sp_contacts_pre = [];
  List sp_contacts_up=[];
  List sp_profile_pre = [];
  List sp_profile_up=[];
  List sp_name_pre=[];
  List sp_name_up=[];
  String alert_pre='';
  String alert_up='';

  Future<void> gettingConsumerPastAppointments() async {
    var results = await SPMethods().getConsumerPastAppointment(consumer['_id']);
    if (results.data['success']) {
      setState(() {
        preActivities = results.data['appointments'];
      });
      if (preActivities.isNotEmpty) {
        print(preActivities);
        for (var i = 0; i < preActivities.length; i++) {
          var result2 = await SPMethods().findSP(preActivities[i]['sp_email']);
          if (result2.data['success']) {
            var sp_local = result2.data['sp'];
            var name;
            if(sp_local['contractorname']!=null){
              name=sp_local['contractorname'];
            }else{
              name=sp_local['username'];
            }
            setState(() {
              sp_contacts_pre.add(sp_local['contactNo']);
              sp_profile_pre.add(sp_local['imageUrl']);
              sp_name_pre.add(name);
            });

          }
        }
        print(sp_contacts_pre);
        print(sp_profile_pre);
        print(sp_name_pre);
      }else{
        setState(() {
          alert_pre='There are no Appointments';
        });
      }
    } else {
      Fluttertoast.showToast(
          msg: 'getting Past Appointments failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> gettingConsumerUpcomingAppointments() async {
    var results = await SPMethods().getConsumerUpcomingAppointment(consumer['_id']);
    if (results.data['success']) {
      setState(() {
        upActivities = results.data['appointments'];
      });
      if (upActivities.isNotEmpty) {
        print(upActivities);
        for (var i = 0; i < upActivities.length; i++) {
          var result2 = await SPMethods().findSP(upActivities[i]['sp_email']);
          if (result2.data['success']) {
            var sp_local = result2.data['sp'];
            var name;
            if(sp_local['contractorname']!=null){
              name=sp_local['contractorname'];
            }else{
              name=sp_local['username'];
            }
            setState(() {
              sp_contacts_up.add(sp_local['contactNo']);
              sp_profile_up.add(sp_local['imageUrl']);
              sp_name_up.add(name);
            });

          }
        }
        print(sp_contacts_up);
        print(sp_profile_up);
        print(sp_name_up);
      }else{
        setState(() {
          alert_up='There are no Appointments';
        });
      }
    } else {
      Fluttertoast.showToast(
          msg: 'getting Upcoming Appointments failed',
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                  child: Text(
                    'Activities',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 14.0,
                shadowColor: Color(0x802196F3),
                margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              '${consumer['username']}',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8.0, 16.0, 0),
                            child: Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage("${consumer['imageUrl']}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),],
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                child: Text(
                  'Past Appointments',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                child:Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  height: 220,
                  width: 400,
                  child:  (alert_pre!='')?Center(child: Text(alert_pre,style: TextStyle(color: Colors.black),)) : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: preActivities.length,
                    itemBuilder: (context, index) {
                      return Card(
                        // color: Colors.cyanAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 10.0,
                        shadowColor: Colors.blueAccent,
                        margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListTile(
                            onTap: () async {
                                var sp_email=preActivities[index]['sp_email'];
                                var result=await SPMethods().findSP(sp_email);
                                if(result.data['success']){
                                  sp=result.data['sp'];
                                  if(result.data['role']=="contractor"){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Cscontractorview()));
                                  }else if(result.data['role']=="transporter"){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Cstransporterview()));
                                  }else if(result.data['role']=="labour"){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Cslabourview()));
                                  }
                                }
                            },
                            visualDensity: VisualDensity(vertical: 4),
                            leading: Container(
                              height: 100,
                              width: 80,
                              // child: Image.asset('assets/imgs/${preActivities[index].profile}'),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  // NetworkImage("${sp_profile_pre[index]}"),
                                  image:NetworkImage('${sp_profile_pre[index]}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Row(
                              children: [
                                Expanded(
                                  flex:6,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex:1,
                                            child: Text(
                                              'Hired',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child: Text(
                                              // preActivities[index].hired
                                              sp_name_pre[index],
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.0),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex:1,
                                            child: Text(
                                              'Date',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child: Text(
                                              //preActivities[index]['date'],
                                              preActivities[index]['date'].toString().substring(0,10),
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 13.0,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  flex:1,
                                  child: IconButton(
                                    splashColor: Colors.lightBlueAccent,
                                    icon: Icon(
                                        Icons.add_call
                                    ),
                                    onPressed: (){
                                      launch("tel://+94${sp_contacts_pre[index].toString().substring(1)}");
                                    },
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  flex:1,
                                  child: IconButton(
                                  splashColor: Colors.lightGreen,
                                  icon: Icon(
                                    MyFlutterApp.whatsapp,
                                  ),
                                  onPressed: (){
                                    launchwhatsapp( number:"tel://+94${sp_contacts_pre[index].toString().substring(1)}",message: "hello");
                                  },
                                  color: Colors.green,
                                ),)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                child: Text(
                  'Upcoming Appointments',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  height: 220,
                  width: 400,
                  child: (alert_up!='')?Center(child: Text(alert_up,style: TextStyle(color: Colors.black),)): ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: upActivities.length,
                    itemBuilder: (context, index) {
                      return Card(
                        // color: Colors.cyanAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 10.0,
                        shadowColor: Colors.blueAccent,
                        margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListTile(
                            onTap: () async {
                              var sp_email=upActivities[index]['sp_email'];
                              var result=await SPMethods().findSP(sp_email);
                              if(result.data['success']){
                                sp=result.data['sp'];
                                if(result.data['role']=="contractor"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cscontractorview()));
                                }else if(result.data['role']=="transporter"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cstransporterview()));
                                }else if(result.data['role']=="labour"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cslabourview()));
                                }
                              }
                            },
                            visualDensity: VisualDensity(vertical: 4),
                            leading: Container(
                              height: 100,
                              width: 80,
                              // child: Image.asset('assets/imgs/${preActivities[index].profile}'),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  // NetworkImage("${sp_profile_pre[index]}"),
                                  image:NetworkImage('${sp_profile_up[index]}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Row(
                              children: [
                                Expanded(
                                  flex:6,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex:1,
                                            child: Text(
                                              'Hired',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child: Text(
                                              // preActivities[index].hired
                                              sp_name_up[index],
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.0),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex:1,
                                            child: Text(
                                              'Date',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child: Text(
                                              //preActivities[index]['date'],
                                              upActivities[index]['date'].toString().substring(0,10),
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 13.0,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex:1,
                                            child: Text(
                                              'Time',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child: Text(
                                              //preActivities[index]['date'],
                                              '${upActivities[index]['time']}  (24 Hours)',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 13.0,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  flex:1,
                                  child: IconButton(
                                    splashColor: Colors.lightBlueAccent,
                                    icon: Icon(
                                        Icons.add_call
                                    ),
                                    onPressed: (){
                                      launch("tel://+94${sp_contacts_up[index].toString().substring(1)}");
                                    },
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  flex:1,
                                  child: IconButton(
                                    splashColor: Colors.lightGreen,
                                    icon: Icon(
                                      MyFlutterApp.whatsapp,
                                    ),
                                    onPressed: (){
                                      launchwhatsapp( number:"tel://+94${sp_contacts_up[index].toString().substring(1)}",message: "hello");
                                    },
                                    color: Colors.green,
                                  ),)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void launchwhatsapp({@required number,@required message}) async{
    String url="whatsapp://send?phone=$number&text=$message";
    await canLaunch(url)?launch(url):print("cant't open whatsapp ");

  }
}
