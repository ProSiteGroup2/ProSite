import 'package:flutter/material.dart';
import 'package:group2/Classes/notify.dart';

import '../Classes/notification_methods.dart';
import '../globals.dart';

class Notifications_hd extends StatefulWidget {
  const Notifications_hd({Key? key}) : super(key: key);

  @override
  State<Notifications_hd> createState() => _Notifications_hdState();
}

class _Notifications_hdState extends State<Notifications_hd> {

  @override
  List notices=[];
  String alert_text='';

  @override
  void initState() {
    gettingHardwareNotifications();
    super.initState();
  }

  Future<void> gettingHardwareNotifications()async {
    var result=await NotificationMethods().getHardwareNotify(sp['_id']);
    if (result.data['success']){
      var local_hardware=result.data['hardware'];
      setState(() {
        notices=local_hardware['notifications'];
      });

      if(notices.isEmpty){
        alert_text='No Notifications';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top:20.0, bottom: 20.0),
                child: Text('Notifications',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0
                  ),
                ),
              ),),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                height: 600,
                width: 400,
                child: alert_text!=''?Center(child: Text(alert_text),):notices.isEmpty?Center(child: CircularProgressIndicator()): ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: notices.length,
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
                        padding: const EdgeInsets.all(4.0),
                        child: ListTile(
                          onTap: () {},
                          leading: Container(
                            height: 70,
                            width: 70,
                            // child: Image.asset('assets/imgs/${preActivities[index].profile}'),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage('${notices[index]['product']['imageUrl']}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title:Column(
                            children: [
                              Text(notices[index]['message'],
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                ),),
                              SizedBox(height: 10.0,),
                              Text('Date: ${notices[index]['createdAt'].toString().substring(0,10)}',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey
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
    );
  }
}
