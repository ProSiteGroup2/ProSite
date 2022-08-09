import 'package:flutter/material.dart';
import 'package:group2/pages/edit_transporterprofile.dart';

import '../globals.dart';

class Transporterpview extends StatefulWidget {
  const Transporterpview({Key? key}) : super(key: key);

  @override
  State<Transporterpview> createState() => _TransporterpviewState();
}

class _TransporterpviewState extends State<Transporterpview> {
  List<String> items = [
    'assets/imgs/t1.jpg',
    'assets/imgs/t2.webp',
    'assets/imgs/t3.jpg',
    'assets/imgs/t4.webp',
    'assets/imgs/t5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(hexColor('#F0F0F0')),
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton<int>(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  itemBuilder: (context) => [
                    const PopupMenuItem<int>(
                        value: 0, child: Text('Edit Profile'))
                  ],
                  onSelected: (item) => onSelete(context, item),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(hexColor('#FEFEFE')),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(42.0))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70.0,
                      ),
                      Center(
                        child: Text(
                          '${sp['username']}', //username
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      /*const Center(
                        child: Text(
                          'mason',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),*/
                      Container(
                          height: 150.0,
                          //width: MediaQuery.of(context).size.width,
                          margin:
                              const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          //padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
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
                          margin:
                              const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 40.0),
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
                                children:[
                                  Icon(Icons.email_outlined),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '${sp['email']}', // email
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
                                  Icon(Icons.location_on,
                                  color: Colors.red,),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '${sp['hometown']}, ${sp['district']}',
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
                                  Icon(Icons.home),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '${sp['address']}', //home twon
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
                                  Icon(Icons.phone,
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
                                children:[
                                  Icon(Icons.car_repair_sharp,
                                    color: Colors.blue,),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '${sp['vehicle']}',
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
                                children:[
                                  Icon(Icons.work_rounded),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Work out of District: ${sp['work_out']}',
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
          ]),
        ),
      ),
    );
  }
}

void onSelete(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Edittransporter()));
  }
}

hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}