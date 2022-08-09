import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:group2/pages/feedback_transporter.dart';
import 'package:group2/pages/pick_date.dart';
import 'package:url_launcher/url_launcher.dart';

import '../globals.dart';

class Cstransporterview extends StatefulWidget {
  const Cstransporterview({Key? key}) : super(key: key);

  @override
  State<Cstransporterview> createState() => _CstransporterviewState();
}

class _CstransporterviewState extends State<Cstransporterview> {
  double rating = 0;

  List<String> items = [
    'assets/imgs/t1.jpg',
    'assets/imgs/t2.webp',
    'assets/imgs/t3.jpg',
    'assets/imgs/t4.webp',
    'assets/imgs/t5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
                  Center(
                    child: Text(
                      '${sp['username']}',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Transporter',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
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
                      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
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
                            children:  [
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
                            children:[
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
                            children: [
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
                            children:  [
                              Icon(Icons.work_sharp),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Work out of District : ${sp['work_out']}',
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(hexColor('#1982BD')),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                16.0))),
                                onPressed: () {
                                  launchwhatsapp(
                                      number:
                                      "tel://+94${sp['contactNo'].substring(1)}",
                                      message: "Hello");
                                },
                                icon: const Text(
                                  'Chat',
                                  style: TextStyle(color: Colors.white),
                                ),
                                label: const Icon(Icons.chat),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(hexColor('#1982BD')),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                16.0))),
                                onPressed: () {
                                  launch(
                                      "tel://+94${sp['contactNo'].substring(1)}");
                                },
                                icon: const Text(
                                  'Call',
                                  style: TextStyle(color: Colors.white),
                                ),
                                label: const Icon(Icons.add_call),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(hexColor('#1982BD')),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                16.0))),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => pickdate()),
                                  );
                                },
                                child: const Text(
                                  'Appointment',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(hexColor('#1982BD')),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                16.0))),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FeedbackTran()),
                                  );
                                },
                                child: const Text(
                                  'Give/View Feedback',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  const Center(
                    child: Text(
                      'Rate Him',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: RatingBar.builder(
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemCount: 5,
                      itemSize: 30,
                      updateOnDrag: true,
                      itemBuilder: (BuildContext context, _) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      },
                      onRatingUpdate: (rating) {
                        setState(() {
                          this.rating = rating;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  )
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
                      fit: BoxFit.cover,
                    )),
              ),
            ))
          ],
        ),
      ),
    );
  }

  void launchwhatsapp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunch(url) ? launch(url) : print("cant't open whatsapp ");
  }
}

hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
