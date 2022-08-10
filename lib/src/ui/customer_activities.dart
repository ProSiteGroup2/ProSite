import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group2/Classes/customer_pre_activities.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Classes/my_flutter_app_icons.dart';


class CActivity extends StatefulWidget {
  const CActivity({Key? key}) : super(key: key);

  @override
  _CActivityState createState() => _CActivityState();
}

class _CActivityState extends State<CActivity> {
  @override
  Widget build(BuildContext context) {
    List<PreAct> preActivities = [
      PreAct('worker1.jpg', 'hello', '2022-11-3'),
      PreAct('worker2.jpg', 'Hi', '2022-09-3'),
      PreAct('worker3.jpg', 'Wanda', '2022-06-3'),
      PreAct('worker2.jpg', 'Hi', '2022-09-3'),
    ];

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
                              'Rashan Fernando',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
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
                                  image: AssetImage("assets/imgs/pro1.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 9.0),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,),
                        onPressed: () {},
                        child: Text(
                          'View Appointments',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ),
                    SizedBox(height: 5.0),],
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                child: Text(
                  'Previous Activities',
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
                  height: 400,
                  width: 400,
                  child: ListView.builder(
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
                                  image: AssetImage(
                                      "assets/imgs/${preActivities[index].profile}"),
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
                                              preActivities[index].hired,
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
                                              preActivities[index].date,
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
                                      launch("tel://+94787145867");
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
                                    launchwhatsapp( number:"tel://+94787145867",message: "hello");
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
