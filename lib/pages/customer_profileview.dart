import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:group2/pages/edit_csprofile.dart';
import 'package:group2/globals.dart';
//import 'package:http/http.dart' as http;


class Customerpview extends StatefulWidget {
  const Customerpview({Key? key}) : super(key: key);

  @override
  State<Customerpview> createState() => _CustomerpviewState();
}

class _CustomerpviewState extends State<Customerpview> {


  /*Future<Map<String,dynamic>> getuser() async{
    try{
      var result = await http.get(Uri.parse('http://10.0.2.2:5000//getConsumerInfo'),
      headers: {}
      );
      if(jsonDecode(result.body)['success']) return jsonDecode(result.body)['consumer'];
      else{
        return jsonDecode(result.body)['msg'];
      }
    }catch(err){
      print(err.toString());
      return {};
    }
}*/

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
                /*Container(
                  child: FutureBuilder<Map<String, dynamic>>(
                    future: getuser(),
                    builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot){
                      if(snapshot.hasData){
                        if(snapshot.data!.isEmpty){
                          return const Text('no data');
                        }else{
                          return ;
                        }
                      }else{
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),*/
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
                          '${consumer['username']}',
                          style: const TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
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
                                children:  [
                                  const Icon(Icons.location_on),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '${consumer['hometown']}, ${consumer['district']}',
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.home_filled),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '${consumer['address']}',
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.email_rounded),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('${consumer['email']}',
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.phone_in_talk_outlined),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('${consumer['username']}',
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(children: [
                                const Icon(Icons.home),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text('${consumer['hometown']}',
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ]),
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
                          '${consumer['imageUrl']}',
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
          context, MaterialPageRoute(builder: (context) => Editcsprofile()));
  }
}

hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
