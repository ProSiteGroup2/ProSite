import 'package:flutter/material.dart';
import 'package:group2/pages/edit_transporterprofile.dart';
import '../Classes/userprofiles_getdatamethods.dart';
import 'changetran_pw.dart';


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
  String url = 'https://prositegroup2.herokuapp.com';

  Future<Map<String, dynamic>?> getData() async {
    try {
      print('1');
      var result = await GetUsersData().getTrnasporterInfo('$url/getTransporterInfo');
      print(result);
      return result;
    } catch (err) {
      print(err.toString());
      return {};
    }
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
                                value: 1, child: Text('Change Password')),
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
                                  '${snapshot.data!['username']}', //username
                                  style: const TextStyle(
                                      fontSize: 30.0, fontWeight: FontWeight.bold),
                                ),
                              ),

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
                                            '${snapshot.data!['hometown']}, ${snapshot.data!['district']}',
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
                                          const Icon(Icons.home),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            '${snapshot.data!['address']}', //home twon
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
                                            '${snapshot.data!['contactNo']}',
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
                                          const Icon(Icons.car_repair_sharp,
                                            color: Colors.blue,),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            '${snapshot.data!['vehicle']}',
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
                                          const Icon(Icons.work_rounded),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            'Work out of District: ${snapshot.data!['work_out']}',
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
                              child: SizedBox(
                                height: 107.0,
                                width: 115.0,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: snapshot.data!['imageUrl']!=null?Image.network(
                                      '${snapshot.data!['imageUrl']}',
                                      fit: BoxFit.cover,
                                    ):Image.asset('assets/imgs/profile.jpg')),
                              ),
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
                    return CircularProgressIndicator();
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
            context, MaterialPageRoute(builder: (context) => Edittransporter(data!)));
        setState(() {});
        break;
      case 1:
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Changetran_pw()),
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
