import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group2/pages/changepw.dart';
import 'package:image_picker/image_picker.dart';
import 'customer_profileview.dart';
import 'package:group2/globals.dart';
import 'package:http/http.dart' as http;
import 'package:group2/Classes/update_methods.dart';

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

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactnumController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _hometwonController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController.text = consumer['username'];
    _emailController.text = consumer['email'];
    _contactnumController.text = consumer['contactNo'];
    _addressController.text = consumer['address'];
    _hometwonController.text = consumer['hometown'];
    _districtController.text = consumer['district'];
  }

  /*Future<void> savechanges (String username ,String email ,String contactNo ,String address ,String hometown ,String district) async{
    Map<String,dynamic> data = {
        "username" : username,
        "email": email,
        "contactNo":contactNo,
        "address":address,
        "hometown":hometown,
        "district":district
    };

    try{
          await UpdateServices().upadateData('https://dashboard.heroku.com/apps/prositegroup2/updateconsumerinfo',data);
    }catch(err){
        print(err.toString());
    }
  }*/


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  File? image;
  Future pickImage(ImageSource source) async {
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
  }

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
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(hexColor('#FEFEFE')),
                  borderRadius: const BorderRadius.all(Radius.circular(42.0))),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70.0,
                    ),
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
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                          child: TextFormField(
                            controller: _usernameController,
                            validator: (value){
                              if(value != null && value.length == 0){
                                return '*Required Field';
                              }
                              else{
                                return null;
                              }
                            },
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
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value){
                              if(value != null && value.length == 0){
                                return '*Required Field';
                              }
                              else{
                                return null;
                              }
                            },
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
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                          child: TextFormField(
                            controller: _contactnumController,
                            validator: (value){
                              if(value != null && value.length == 0){
                                return '*Required Field';
                              }
                              else{
                                return null;
                              }
                            },
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
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                          child: TextFormField(
                            controller: _addressController,
                            validator: (value){
                              if(value != null && value.length == 0){
                                return '*Required Field';
                              }
                              else{
                                return null;
                              }
                            },
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
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                          child: TextFormField(
                            controller: _hometwonController,
                            validator: (value){
                              if(value != null && value.length == 0){
                                return '*Required Field';
                              }
                              else{
                                return null;
                              }
                            },
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
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                          child: TextFormField(
                            controller: _districtController,
                            validator: (value){
                              if(value != null && value.length == 0){
                                return '*Required Field';
                              }
                              else{
                                return null;
                              }
                            },
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
                        onPressed: () {/*async{
                          if(_formkey.currentState!.validate()){
                            await savechanges(
                              _usernameController.text,
                              _emailController.text,
                              _contactnumController.text,
                              _addressController.text,
                              _hometwonController.text,
                              _districtController.text
                            );
                          }*/

                        },
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
            ),
            Positioned(
                child: Center(
              child: Stack(children: [
                SizedBox(
                  height: 107.0,
                  width: 115.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: image != null
                          ? Image.file(
                              image!,
                              width: 115.0,
                              height: 107.0,
                              fit: BoxFit.fill,
                            )
                          : Image.asset(
                              'assets/imgs/user1.webp',
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
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 100.0,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              child: Column(
                                children: [
                                  Text('Choose profile photo'),
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
                                                    BorderRadiusDirectional
                                                        .circular(16.0))),
                                        onPressed: () {
                                          pickImage(ImageSource.gallery);
                                        },
                                        child: const Text(
                                          'Add from galery',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(hexColor('#1982BD')),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(16.0))),
                                        onPressed: () {
                                          pickImage(ImageSource.camera);
                                        },
                                        child: const Text(
                                          'Add from Camera',
                                          style: TextStyle(color: Colors.white),
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

