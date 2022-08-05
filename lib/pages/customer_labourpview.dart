import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Cslabourview extends StatefulWidget {
  const Cslabourview({Key? key}) : super(key: key);

  @override
  State<Cslabourview> createState() => _CslabourviewState();
}

class _CslabourviewState extends State<Cslabourview> {
  double rating = 0;

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
                  const Center(
                    child: Text(
                      'Aaron Graham',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Mason',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 250.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(8.0)),
                    margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    /*child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context ,index){
                            return SizedBox(
                              height: 130,
                              width: 120,

                              child: ClipRRect(
                                child: Image.asset(items[index],fit: BoxFit.fill,),
                              ),
                            );
                          }
                      )*/
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(
                                10.0, 10.0, 10.0, 10.0),
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 30.0, 0.0, 0.0),
                                      child: Text(
                                        'A House Planning',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Edurapotha, Kegalle',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Owaner is Ravindu perera',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Cost is 1Milion',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: SizedBox(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                                'assets/imgs/aaa.jpg')))),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(
                                10.0, 10.0, 10.0, 10.0),
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 30.0, 0.0, 0.0),
                                      child: Text(
                                        'A House Planning',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Edurapotha, Kegalle',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Owaner is Ravindu perera',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Cost is 1Milion',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: SizedBox(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                                'assets/imgs/ddd.jpg')))),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(
                                10.0, 10.0, 10.0, 10.0),
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 30.0, 0.0, 0.0),
                                      child: Text(
                                        'A House Planning',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Edurapotha, Kegalle',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Owaner is Ravindu perera',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Cost is 1Milion',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: SizedBox(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/imgs/ccc.jpeg',
                                            )))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
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
                                onPressed: () {},
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
                                onPressed: () {},
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
                                onPressed: () {},
                                child: const Text(
                                  'appointment',
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
                                onPressed: () {},
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
