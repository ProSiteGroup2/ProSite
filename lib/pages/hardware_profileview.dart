import 'package:flutter/material.dart';
import 'package:group2/pages/edit_hdprofile.dart';

import '../globals.dart';

class Hardwareprofile extends StatefulWidget {
  const Hardwareprofile({Key? key}) : super(key: key);

  @override
  State<Hardwareprofile> createState() => _HardwareprofileState();
}

class _HardwareprofileState extends State<Hardwareprofile> {
  List<String> items = [
    'assets/imgs/h1.jpg',
    'assets/imgs/h2.jpg',
    'assets/imgs/h4.jpg',
    'assets/imgs/h5.jpg',
    'assets/imgs/h6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*leading: IconButton(
          onPressed: () {  },
          icon:const Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.blueAccent,
        ),*/
        elevation: 0.0,
        backgroundColor: Color(hexColor('#F0F0F0')),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.menu, color: Colors.black),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(value: 0, child: Text('Edit Profile'))
            ],
            onSelected: (item) => onSelete(context, item),
          )
        ],
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
                   Center(
                    child: Text(
                      '${sp['hardwarename']}',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      height: 150.0,
                      //width: MediaQuery.of(context).size.width,
                      //color: Colors.blue,
                      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      /*padding:
                          const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),*/
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.green[200],
                      ),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 130,
                              width: 120,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 5.0, 10.0),
                                child: ClipRRect(
                                  child: Image.asset(
                                    items[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          })),
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
                            children:  [
                              Icon(Icons.location_on,
                              color: Colors.red,),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${sp['city']}, ${sp['district']}',
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
                            children: [
                              Icon(Icons.home_filled),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${sp['address']}',
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
                            children:  [
                              Icon(Icons.email_rounded),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${sp['email']}',
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
                            children:  [
                              Icon(Icons.phone_in_talk,
                              color: Colors.green,),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${sp['contactNo']}',
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
                            children: [
                              Icon(Icons.confirmation_number),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Registration: ${sp['regno']}',
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
                            children: [
                              Icon(Icons.account_box_outlined),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Owner: ${sp['owner']}',
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
                    child: Image.network(
                      '${sp['imageUrl']}',
                      fit: BoxFit.fill,
                    )),
              ),
            ))
          ],
        ),
      ),
    );
  }

  void onSelete(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Edithdprofile()));
    }
  }
}

hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
