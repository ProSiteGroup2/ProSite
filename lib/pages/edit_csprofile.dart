import 'package:flutter/material.dart';
import 'package:group2/pages/changepw.dart';
import 'customer_profileview.dart';

class Editcsprofile extends StatefulWidget {
  const Editcsprofile({Key? key}) : super(key: key);

  @override
  State<Editcsprofile> createState() => _EditcsprofileState();
}

class _EditcsprofileState extends State<Editcsprofile> {
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Customerpview()),
            );
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
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(hexColor('#FEFEFE')),
                  borderRadius: const BorderRadius.all(Radius.circular(42.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70.0,
                  ),
                  /*const Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'First Name:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.blueGrey[50],
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 5.0,
                          offset: Offset(7.0, 7.0),
                        )
                      ],
                    ),
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                        child: TextField(
                          cursorColor: Colors.black12,
                        )),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),*/
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'User Name:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.blueGrey[50],
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 5.0,
                          offset: Offset(7.0, 7.0),
                        )
                      ],
                    ),
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                        child: TextField(
                          cursorColor: Colors.black12,
                        )),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Email:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.blueGrey[50],
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 5.0,
                          offset: Offset(7.0, 7.0),
                        )
                      ],
                    ),
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                        child: TextField(
                          cursorColor: Colors.black12,
                        )),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Contact Number:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.blueGrey[50],
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 5.0,
                          offset: Offset(7.0, 7.0),
                        )
                      ],
                    ),
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                        child: TextField(
                          cursorColor: Colors.black12,
                        )),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Home Address:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.blueGrey[50],
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 5.0,
                          offset: Offset(7.0, 7.0),
                        )
                      ],
                    ),
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                        child: TextField(
                          cursorColor: Colors.black12,
                        )),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Home Town:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.blueGrey[50],
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 5.0,
                          offset: Offset(7.0, 7.0),
                        )
                      ],
                    ),
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                        child: TextField(
                          cursorColor: Colors.black12,
                        )),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Distric:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.blueGrey[50],
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 5.0,
                          offset: Offset(7.0, 7.0),
                        )
                      ],
                    ),
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                        child: TextField(
                          cursorColor: Colors.black12,
                        )),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: ElevatedButton.icon(
                      //label: Icon(Icons.lock),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey[700],
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(16.0))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Change_pw()),
                        );
                      },
                      icon: const Text(
                        'Changed Password',
                        style: TextStyle(color: Colors.white),
                      ),
                      label: const Icon(Icons.lock),
                    ),
                  ),
                  const Divider(
                    height: 20.0,
                    color: Colors.black,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(hexColor('#1982BD')),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(16.0))),
                      onPressed: () {},
                      child: const Text(
                        'Save changes',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
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
                      child: Image.asset(
                        'assets/user1.webp',
                        fit: BoxFit.fill,
                      )),
                ),
                Positioned(
                    bottom: -5.0,
                    right: -5.0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ))
              ]),
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
