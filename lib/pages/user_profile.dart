// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class User_Profile extends StatefulWidget {
  const User_Profile({Key? key}) : super(key: key);

  @override
  _User_ProfileState createState() => _User_ProfileState();
}

class _User_ProfileState extends State<User_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new_sharp),
            color: Colors.blue[900],
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'Profile Settings',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 110.0, 0.0, 0.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.0),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Add Your Work Here',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child:
                                            Image.asset('assets/imgs/aaa.jpg')),
                                    Expanded(
                                        flex: 1,
                                        child:
                                            Image.asset('assets/imgs/bbb.jpg')),
                                    Expanded(
                                        flex: 1,
                                        child: Image.asset(
                                            'assets/imgs/ccc.jpeg')),
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child:
                                            Image.asset('assets/imgs/ddd.jpg')),
                                    Expanded(
                                        flex: 1,
                                        child:
                                            Image.asset('assets/imgs/eee.jpg')),
                                    Expanded(
                                        flex: 1,
                                        child: Image.asset(
                                            'assets/imgs/ccc.jpeg')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 25.0),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'First Name:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            height: 50.0,
                            width: 1000.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              color: Colors.blueGrey[50],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  blurRadius: 10.0,
                                  offset: Offset(10.0, 10.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                              child: Text('KRISHAN'),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Last Name:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            height: 50.0,
                            width: 1000.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              color: Colors.blueGrey[50],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  blurRadius: 10.0,
                                  offset: Offset(10.0, 10.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                              child: Text('Weerarathna'),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Email:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            height: 50.0,
                            width: 1000.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              color: Colors.blueGrey[50],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  blurRadius: 10.0,
                                  offset: Offset(10.0, 10.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                              child: Text('krishan@gmail.com'),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Contact Number:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            height: 50.0,
                            width: 1000.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              color: Colors.blueGrey[50],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  blurRadius: 10.0,
                                  offset: Offset(10.0, 10.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                              child: Text('07775555556666'),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Address:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            height: 50.0,
                            width: 1000.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              color: Colors.blueGrey[50],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  blurRadius: 10.0,
                                  offset: Offset(10.0, 10.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                              child: Text('Edurapotha,Kegalle'),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Home Twon:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            height: 50.0,
                            width: 1000.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              color: Colors.blueGrey[50],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  blurRadius: 10.0,
                                  offset: Offset(10.0, 10.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                              child: Text('Kegalle'),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Distric:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            height: 50.0,
                            width: 1000.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              color: Colors.blueGrey[50],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  blurRadius: 10.0,
                                  offset: Offset(10.0, 10.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                              child: Text('Kegalle'),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Select Your Qulification Type:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            height: 50.0,
                            width: 1000.0,
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              color: Colors.blueGrey[50],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  blurRadius: 10.0,
                                  offset: Offset(10.0, 10.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                              child: Text('Only Experience'),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            margin: EdgeInsets.fromLTRB(100.0, 0.0, 60.0, 30.0),
                            child: ElevatedButton.icon(
                              //label: Icon(Icons.lock),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey[700],
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadiusDirectional.circular(
                                              16.0))),
                              onPressed: () {},
                              icon: Text(
                                'Changed Password',
                                style: TextStyle(color: Colors.white),
                              ),
                              label: Icon(Icons.lock),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      child: Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 80.0,
                              backgroundImage: AssetImage(
                                'assets/imgs/167621352-confident-asian-male-engineer-worker-standing-arm-crossed-happy-smile-for-enjoy-working-in-factory.jpg',
                              ),
                            ),
                            Positioned(
                                bottom: 0.0,
                                right: 5.0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_a_photo_outlined,
                                    color: Colors.greenAccent[400],
                                    size: 30.0,
                                  ),
                                  onPressed: () {},
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
