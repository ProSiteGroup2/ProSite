// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:group2/Classes/notify.dart';


class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {

    List<Notify> notice=[
      Notify(msg: 'You Hired Mr.Sirisena',img: 'pro2.png'),
      Notify(msg: 'You purchased cement',img: 'cement.png'),
      Notify(msg: 'You purchased safety goggles',img: 'gog.jpg'),
      Notify(msg: 'You hired Mr.Malan',img: 'worker1.jpg')
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                  height: 400,
                  width: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: notice.length,
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
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {},
                            leading: Container(
                              height: 50,
                              width: 55,
                              // child: Image.asset('assets/imgs/${preActivities[index].profile}'),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/imgs/${notice[index].img}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(notice[index].msg,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),),
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
}
