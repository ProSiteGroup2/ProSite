import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/labour_schedule.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group2/Classes/my_flutter_app_icons.dart';
import 'package:group2/Classes/service_provider_methods.dart';
import 'package:url_launcher/url_launcher.dart';

import '../globals.dart';



class LActivity extends StatefulWidget {
  const LActivity({Key? key}) : super(key: key);

  @override
  _LActivityState createState() => _LActivityState();
}

class _LActivityState extends State<LActivity> {


  @override
  List l_schedule=[];
  List l_preActivity=[];

  @override
  void initState() {
    gettingSPPastAppointments();
    gettingSPUpcomingAppointments();
    super.initState();
  }

  String alert_pre='';
  String alert_up='';

  Future<void> gettingSPPastAppointments() async {
    var results=await SPMethods().getSPPastAppointment(sp['email']);
    if(results.data['success']){
      setState(() {
        l_preActivity=results.data['appointments'];
      });
      if(l_preActivity.isEmpty){
        setState(() {
          alert_pre='There are no Appointments';
        });
      }else{
        print(l_preActivity);
      }
    }else{
      Fluttertoast.showToast(
          msg: 'getting Past Appointments failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> gettingSPUpcomingAppointments() async {
    var results=await SPMethods().getSPUpcomingAppointment(sp['email']);
    if(results.data['success']){
      setState(() {
        l_schedule=results.data['appointments'];
      });
      if(l_schedule.isEmpty){
        setState(() {
          alert_up='There are no Appointments';
        });
      }else{
        print(l_schedule);
      }
    }else{
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

    List<int> ratings=[4,4,4,3,5,3];
    int sum_rating=0;
    for (var i = 0;i<ratings.length;i++){
      sum_rating +=ratings[i];
    }
    var avg_rating= (sum_rating/ratings.length);
    avg_rating=double.parse(avg_rating.toStringAsFixed(2));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,20.0,0,0),
                  child: Text(
                    'Activities',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize:25.0,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.cyanAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 14.0,
                shadowColor: Color(0x802196F3),
                margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0,10.0),
                child:Row(
                      children: <Widget>[
                        Expanded(
                          flex:2,
                          child: Column(
                            children: [
                              Text(
                                'Rashan Fernando',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Rating: $avg_rating / 5 ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0,8.0,16.0,10.0),
                            child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset('assets/imgs/pro1.jpg')),
                          ),),
                      ],
                    ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,5.0,0,5.0),
                child: Text(
                  'Upcoming Schedule',
                      style:TextStyle(
                        fontFamily: 'Poppins',
                        fontSize:20.0,
                        fontWeight: FontWeight.bold,
                        color:Colors.black54,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0,0,0,0),
                child: Container(
                  decoration: BoxDecoration(
                    border:Border.all(color: Colors.white,width: 1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  height: 220,
                  width: 400,
                  child: (alert_up!='')? Center(child: Text(alert_up,style: TextStyle(color: Colors.black),)) : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: l_schedule.length,
                    itemBuilder: (context,index){
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 10.0,
                        shadowColor: Colors.blueAccent,
                        margin: EdgeInsets.fromLTRB(10.0, 0,10.0,10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListTile(
                            visualDensity: VisualDensity(vertical: 4),
                            leading: Container(
                              height:100,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage('${l_schedule[index]['consumer']['imageUrl']}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title:Row(
                              children: [
                                Expanded(
                                  flex:6,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex:2,
                                            child: Text(
                                              'HiredBy',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:4,
                                            child: Text(
                                              // preActivities[index].hired
                                              l_schedule[index]['consumer']['username'],
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
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex:2,
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
                                            flex:4,
                                            child: Text(
                                              l_schedule[index]['date'].toString().substring(0,10),
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
                                              '${l_schedule[index]['time']}  (24 Hours)',
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
                                      launch("tel://+94${l_schedule[index]['consumer']['contactNo'].toString().substring(1)}");
                                    },
                                    color: Colors.black,
                                  ),),
                                SizedBox(width: 5.0),
                                Expanded(
                                  flex:1,
                                  child: IconButton(
                                    splashColor: Colors.lightGreen,
                                    icon: Icon(
                                      MyFlutterApp.whatsapp
                                    ),
                                    onPressed: (){
                                      launchwhatsapp( number:"tel://+94${l_schedule[index]['consumer']['contactNo'].toString().substring(1)}",message: "Hello");
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,5.0,0,5.0),
                child: Text(
                  'Past Activities',
                  style:TextStyle(
                    fontFamily: 'Poppins',
                    fontSize:20.0,
                    fontWeight: FontWeight.bold,
                    color:Colors.black54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0,0,0,0),
                child: Container(
                  decoration: BoxDecoration(
                    border:Border.all(color: Colors.white,width: 1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  height: 220,
                  width: 400,
                  child: (alert_pre!='')? Center(child: Text(alert_pre,style: TextStyle(color: Colors.black),)) : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: l_preActivity.length,
                    itemBuilder: (context,index){
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 10.0,
                        shadowColor: Colors.blueAccent,
                        margin: EdgeInsets.fromLTRB(10.0, 0,10.0,10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListTile(
                            visualDensity: VisualDensity(vertical: 4),
                            leading: Container(
                              height:100,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage('${l_preActivity[index]['consumer']['imageUrl']}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title:Row(
                              children: [
                                Expanded(
                                  flex:6,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        l_preActivity[index]['consumer']['username'],
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              l_preActivity[index]['date'].toString().substring(0,10),
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.black54,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          Expanded(
                                              child:Text(
                                                '${l_preActivity[index]['time']} (24 Hours)',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12.0,
                                                  color: Colors.black54,
                                                ),
                                              )
                                          )
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
                                      launch("tel://+94${l_preActivity[index]['consumer']['contactNo'].toString().substring(1)}");
                                    },
                                    color: Colors.black,
                                  ),),

                                Expanded(
                                  flex:1,
                                  child: IconButton(
                                    splashColor: Colors.lightGreen,
                                    icon: Icon(
                                        MyFlutterApp.whatsapp,
                                    ),
                                    onPressed: (){
                                      launchwhatsapp( number:"tel://+94${l_preActivity[index]['consumer']['contactNo'].toString().substring(1)}",message: "Hello");
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
