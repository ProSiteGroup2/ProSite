import 'dart:io';
import 'package:flutter/material.dart';
import 'package:group2/pages/sp_transporter_profileview.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:group2/globals.dart';
import 'package:http/http.dart' as http;
import 'package:group2/Classes/update_methods.dart';

class Edittransporter extends StatefulWidget {
  Map<String, dynamic> data;
  Edittransporter(this.data);

  @override
  State<Edittransporter> createState() => _EdittransporterState();
}

class _EdittransporterState extends State<Edittransporter> {
  /*List<String> items = [
    'assets/imgs/aaa.jpg',
    'assets/imgs/bbb.jpg',
    'assets/imgs/ccc.jpeg',
    'assets/imgs/ddd.jpg',
    'assets/imgs/eee.jpg',
    'assets/imgs/kkk.jpg',
    'assets/imgs/ppp.jfif',
  ];*/

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactnumController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _hometwonController = TextEditingController();
  final TextEditingController _vehicleController = TextEditingController();
  final TextEditingController _workoutController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController.text = widget.data['username'];
    _emailController.text = widget.data['email'];
    _contactnumController.text = widget.data['contactNo'];
    _addressController.text = widget.data['address'];
    _hometwonController.text = widget.data['hometown'];
    _districtController.text = widget.data['district'];
    _vehicleController.text = widget.data['vehicle'];
    _workoutController.text = widget.data['work_out'];
  }
  //String url = 'http://10.0.2.2:5000';
  String url = 'https://prositegroup2.herokuapp.com';
  Future<void> savechanges(String username, String email, String contactNo,
      String address, String hometown, String district, String vehicle, String work_out) async {
    Map<String, dynamic> data = {
      "username": username,
      "email": email,
      "contactNo": contactNo,
      "address": address,
      "hometown": hometown,
      "district": district,
      "vehicle": vehicle,
      "work_out":work_out
    };
    try {
      await UpdateServices().upadateData('$url/updatetransporterinfo', data);
      Navigator.pop(context);
    } catch (err) {
      print(err.toString());
      var snackbar = const SnackBar(
        content: Text('Error: Update is failed'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
        child:
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
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
                        'User name:',
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
                        'Address:',
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
                        'District:',
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
                        'Vehicle:',
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
                            controller: _vehicleController,
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
                        'work out:',
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
                            controller: _workoutController,
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
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(hexColor('#1982BD')),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(16.0))),
                        onPressed: () async{
                          if (_formkey.currentState!.validate()) {
                            await savechanges(
                                _usernameController.text,
                                _emailController.text,
                                _contactnumController.text,
                                _addressController.text,
                              _hometwonController.text,
                                _districtController.text,
                                _vehicleController.text,
                                _workoutController.text
                            );
                          }
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
