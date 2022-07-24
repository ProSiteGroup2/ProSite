import 'package:flutter/material.dart';
import 'package:group2/pages/edit_csprofile.dart';

class Change_pw extends StatefulWidget {
  const Change_pw({Key? key}) : super(key: key);

  @override
  State<Change_pw> createState() => _Change_pwState();
}

class _Change_pwState extends State<Change_pw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Editcsprofile()),
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          //height: 500.0,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(hexColor('#FEFEFE')),
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                child: Text(
                  'New Password:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
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
                height: 15.0,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                child: Text(
                  'Confirm New Password:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
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
                                BorderRadiusDirectional.circular(16.0))),
                    onPressed: () {},
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(hexColor('#1982BD')),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadiusDirectional.circular(16.0))),
                    onPressed: () {},
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ],
              )
            ],
          ),
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
