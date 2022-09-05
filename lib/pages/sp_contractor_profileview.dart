import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../Classes/image_upload.dart';
import '../Classes/userprofiles_getdatamethods.dart';
import 'changecontra_pw.dart';
import 'edit_contractorprof.dart';

class Contractorpview extends StatefulWidget {
  const Contractorpview({Key? key}) : super(key: key);

  @override
  State<Contractorpview> createState() => _ContractorpviewState();
}

class _ContractorpviewState extends State<Contractorpview> {
  List<String> items = [
    'assets/imgs/aaa.jpg',
    'assets/imgs/bbb.jpg',
    'assets/imgs/ccc.jpeg',
    'assets/imgs/ddd.jpg',
    'assets/imgs/eee.jpg',
    'assets/imgs/kkk.jpg',
    'assets/imgs/ppp.jfif',
  ];

  //String url = 'http://10.0.2.2:5000';
  String url = 'https://prositegroup2.herokuapp.com';
  Future<Map<String, dynamic>?> getData() async {
    try {
      print('1');
      var result = await GetUsersData().getLabourInfo('$url/getContractorInfo');
      print(result);
      return result;
    } catch (err) {
      print(err.toString());
      return {};
    }

  }

  File? image;
  Future pickImage(ImageSource source,email) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
    await ImgUpload().contractorProfile(image!,email);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(hexColor('#F0F0F0')),
        body: SingleChildScrollView(
          child: FutureBuilder<Map<String, dynamic>?>(
                    future: getData(),
                    builder: (context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                    if (snapshot.hasData) {
                    if (snapshot.data!.isNotEmpty) {
                      return Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            PopupMenuButton<int>(
                              icon: const Icon(Icons.menu, color: Colors.black),
                              itemBuilder: (context) => [
                                const PopupMenuItem<int>(
                                    value: 0, child: Text('Edit Profile')),
                                const PopupMenuItem<int>(
                                    value: 1, child: Text('Change password'))
                              ],
                              onSelected: (item) => onSelete(item,snapshot.data),
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
                                      '${snapshot.data!['contractorname']}', //username
                                      style: const TextStyle(
                                          fontSize: 30.0, fontWeight: FontWeight.bold),
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
                                            children:[
                                              const Icon(Icons.email_outlined),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                '${snapshot.data!['email']}', // email
                                                style: const TextStyle(
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
                                              const Icon(Icons.location_on,
                                                color: Colors.red,),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                '${snapshot.data!['hometown']}, ${snapshot.data!['district']}', //district
                                                style: const TextStyle(
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
                                              const Icon(Icons.home),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                '${snapshot.data!['address']}', // address
                                                style: const TextStyle(
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
                                              const Icon(Icons.phone,
                                                color: Colors.green,),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                '${snapshot.data!['contactNo']}', //contact no
                                                style: const TextStyle(
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
                                              const Icon(Icons.work_sharp),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                'Registration: ${snapshot.data!['regno']}', //Registrastion number
                                                style: const TextStyle(
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
                                              const Icon(Icons.people_alt),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                'No.of Workers: ${snapshot.data!['no_of_workers']}', //No of workers
                                                style: const TextStyle(
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
                                  child: Stack(children: [
                                    SizedBox(
                                      height: 107.0,
                                      width: 115.0,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(16.0),
                                          child: snapshot.data!['imageUrl']!=null?Image.network(
                                            '${snapshot.data!['imageUrl']}',
                                            fit: BoxFit.cover,
                                          ):Image.asset('assets/imgs/profile.jpg')),
                                    ),
                                    Positioned(
                                        bottom: -5.0,
                                        right: -5.0,
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.add_a_photo_outlined,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  height: 100.0,
                                                  width:
                                                  MediaQuery.of(context).size.width,
                                                  margin: const EdgeInsets.symmetric(
                                                      horizontal: 20.0, vertical: 20.0),
                                                  child: Column(
                                                    children: [
                                                      const Text(
                                                          'Choose profile photo'),
                                                      const SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                primary: Color(hexColor(
                                                                    '#1982BD')),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadiusDirectional
                                                                        .circular(
                                                                        16.0))),
                                                            onPressed: () {
                                                              pickImage(
                                                                  ImageSource.gallery,snapshot.data!['email']);
                                                            },
                                                            child: const Text(
                                                              'Add from galery',
                                                              style: TextStyle(
                                                                  color: Colors.white),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                primary: Color(hexColor(
                                                                    '#1982BD')),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadiusDirectional
                                                                        .circular(
                                                                        16.0))),
                                                            onPressed: () {
                                                              pickImage(
                                                                  ImageSource.camera,snapshot.data!['email']);
                                                            },
                                                            child: const Text(
                                                              'Add from Camera',
                                                              style: TextStyle(
                                                                  color: Colors.white),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ))
                                  ]),
                                ))
                          ],
                        ),
                      ]);
                    } else {
                      return const Text('No data');
                    }
                    } else if (snapshot.hasError) {
                      return const Text('A Error');
                    } else {
                      return const Center(child:  CircularProgressIndicator());
                    }
                    },
                    ),

        ),
      ),
    );
  }

  void onSelete(int item,Map<String, dynamic>? data) async {
    switch (item) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Editcontractor(data!)));
        setState(() {});
        break;
      case 1:
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Changecontra_pw()),
        );
        break;
    }
  }
}


hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
