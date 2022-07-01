// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class User_Profile extends StatefulWidget {
  const User_Profile({Key? key}) : super(key: key);

  @override
  _User_ProfileState createState() => _User_ProfileState();
}

class _User_ProfileState extends State<User_Profile> {
  List<String> items = [
    'assets/imgs/aaa.jpg',
    'assets/imgs/bbb.jpg',
    'assets/imgs/ccc.jpeg',
    'assets/imgs/ddd.jpg',
    'assets/imgs/eee.jpg',
    'assets/imgs/kkk.jpg',
    'assets/imgs/ppp.jfif',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.blueAccent,
        ),
        elevation: 0.0,
        backgroundColor: Color(hexColor('#F0F0F0')),
      ),
      backgroundColor: Color(hexColor('#F0F0F0')),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(hexColor('#FEFEFE')),
                  borderRadius: const BorderRadius.all(Radius.circular(42.0))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 70.0,
                  ),
                  Container(
                      height: 150.0,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      padding:
                          const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 130,
                              width: 120,
                              child: ClipRRect(
                                child: Image.asset(
                                  items[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          })),
                  const Center(
                    child: Text(
                      'Aaron Graham',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'mason',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 40.0),
                      padding:
                          const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(14.0)),
                        color: Colors.grey[100],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'From Gampaha',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: const [
                              Icon(Icons.home_filled),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'B 70/5A,Edurapotha,Kegalle',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: const [
                              Icon(Icons.email_rounded),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'abcd@gmail.com',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: const [
                              Icon(Icons.phone_in_talk_outlined),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '0772222999',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: const [
                              Icon(Icons.work_sharp),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Only with Experience',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Positioned(
                child: Center(
              child: SizedBox(
                height: 107.0,
                width: 115.0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'assets/imgs/suplier.jpg',
                      fit: BoxFit.fill,
                    )),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
