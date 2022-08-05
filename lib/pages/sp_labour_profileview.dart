import 'package:flutter/material.dart';
import 'package:group2/pages/edit_labourpview.dart';

class Labourpview extends StatefulWidget {
  const Labourpview({Key? key}) : super(key: key);

  @override
  State<Labourpview> createState() => _LabourpviewState();
}

class _LabourpviewState extends State<Labourpview> {
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
                      const Center(
                        child: Text(
                          'Aaron Graham', //username
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
                        height: 250.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(8.0)),
                        margin:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                children: const [
                                  Icon(Icons.email_outlined),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Abcd@gmail.com', // email
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
                                    'Kegalle', //district
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
                                  Icon(Icons.holiday_village),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Dewalegama', //home twon
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
                                  Icon(Icons.home),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'B 70/5A,Edurapotha,Kegalle', // address
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
                                  Icon(Icons.phone),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '077-5555999', //contact no
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
                                  Icon(Icons.work),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Diploma',
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
                                  Icon(Icons.work_history),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '2 Yr Experience',
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
          context, MaterialPageRoute(builder: (context) => Editlabour()));
  }
}

hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
