// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:group2/pages/feedback_hardware.dart';
import 'package:group2/pages/pick_date.dart';
import 'package:url_launcher/url_launcher.dart';
import '../globals.dart';

class Customerhdprofileview extends StatefulWidget {
  const Customerhdprofileview({Key? key}) : super(key: key);

  @override
  State<Customerhdprofileview> createState() => _CustomerhdprofileviewState();
}

class _CustomerhdprofileviewState extends State<Customerhdprofileview> {
  double rating = 0;

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
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
                      '${sp['hardwarename']}',
                      style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins",
                      ),
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
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${sp['city']}, ${sp['district']}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "poppins",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.home_filled),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${sp['address']}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "poppins",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.email_rounded),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${sp['email']}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "poppins",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.phone_in_talk_sharp,
                                color: Colors.green,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${sp['contactNo']}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "poppins",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.person_rounded),
                              const SizedBox(
                                width: 5.0,
                              ),
                              const Text(
                                'Owner : ',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "poppins",
                                ),
                              ),
                              Text(
                                '${sp['owner']}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto",
                                ),
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
                              /*ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(hexColor('#1982BD')),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                16.0))),
                                onPressed: () { Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                pickdate()),
                                      );},
                                child: const Text(
                                  'Appointment',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),*/
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
                                        builder: (context) => FeedbackHd()),
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
                      'Rate shop',
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
                    child: sp['imageUrl']!=null?Image.network(
                      '${sp['imageUrl']}',
                      fit: BoxFit.cover,
                    ):Image.asset('assets/imgs/profile.jpg')),
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
