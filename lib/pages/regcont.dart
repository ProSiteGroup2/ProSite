import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class RegCont extends StatefulWidget {
  const RegCont({Key? key}) : super(key: key);

  @override
  State<RegCont> createState() => _RegContState();
}

class _RegContState extends State<RegCont> {
  var w_choose;
  List workers = [
    "Less than 10",
    "10-20",
    "20-30",
    "30-50",
    "More than 50",
  ];
  var d_choose;
  List location = [
    "Ampara",
    "Anuradhapura",
    "Badulla",
    "Batticaloa",
    "Colombo",
    "Galle",
    "Gampaha",
    "Hambanthota",
    "Jaffna",
    "Kalutara",
    "Kandy",
    "Kegalle",
    "Kilinochchi",
    "Kurunegala",
    "Mannar",
    "Matale",
    "Matara",
    "Monaragala",
    "Mullaitivu",
    "Nuwara Eliya",
    "Polonnaruwa",
    "Puttalam",
    "Ratnapura",
    "Trincomalee",
    "Vavuniya"
  ];
  final _formKey = GlobalKey<FormState>();

  String _contEmail = '';
  String _contName = '';
  String _contpassword = '';
  String _contconfirmPassword = '';
  String _contConNum = '';
  String _contAddress = '';
  String _contTown = '';
  String _contDistrict = '';
  String _contRegNum = '';
  String _contOwName = '';
  String _contWorkers = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_contEmail);
      debugPrint(_contName);
      debugPrint(_contpassword);
      debugPrint(_contconfirmPassword);
      debugPrint(_contConNum);
      debugPrint(_contAddress);
      debugPrint(_contTown);
      debugPrint(_contDistrict);
      debugPrint(_contRegNum);
      debugPrint(_contOwName);
      debugPrint(_contWorkers);
    }
  }

  @override
  final cont_emailController = TextEditingController();
  final cont_usernameController = TextEditingController();
  final cont_connumController = TextEditingController();
  final cont_addressController = TextEditingController();
  final cont_hmtownController = TextEditingController();
  final cont_districtController = TextEditingController();
  final cont_passwordController = TextEditingController();
  final cont_regnumController = TextEditingController();
  final cont_ownameController = TextEditingController();

  late bool _passwordVisible;
  void initState() {
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/imgs/bg2.png"),
                fit: BoxFit.cover,
                alignment: Alignment.center),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                  child: Text(
                    "Registration",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 32.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF5D5D5D),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 700,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        child: Column(children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0),
                            child: TextFormField(
                              controller: cont_usernameController,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.business_sharp,
                                    color: Colors.blueGrey,
                                  ),
                                  labelText: 'Company Name',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blueGrey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'This field is required';
                                }
                                if (value.trim().length < 4) {
                                  return 'Username must be at least 4 characters in length';
                                }
                                return null;
                              },
                              onChanged: (value) => _contName = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0),
                            child: TextFormField(
                              controller: cont_emailController,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.mail_sharp,
                                    color: Colors.blueGrey,
                                  ),
                                  labelText: 'Email Address',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blueGrey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your email address';
                                }
                                // Check if the entered email has the right format
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                // Return null if the entered email is valid
                                return null;
                              },
                              onChanged: (value) => _contEmail = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0),
                            child: TextFormField(
                              controller: cont_connumController,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.phone_android_rounded,
                                      color: Colors.blueGrey),
                                  labelText: 'Contact Number',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blueGrey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              onChanged: (value) => _contConNum = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: TextFormField(
                              controller: cont_addressController,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.add_home_sharp,
                                      color: Colors.blueGrey),
                                  labelText: 'Company address',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blueGrey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              onChanged: (value) => _contAddress = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: TextFormField(
                              controller: cont_hmtownController,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.location_city_rounded,
                                      color: Colors.blueGrey),
                                  labelText: 'City Name',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blueGrey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              onChanged: (value) => _contTown = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 70.0, vertical: 10.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.blueGrey, width: 3),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: DropdownButtonFormField(
                                validator: (value) {
                                  if (value == null) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                //onChanged: (value) => _userDistrict = value,
                                hint: Text('Select District'),
                                dropdownColor: Colors.white,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.blue,
                                ),
                                iconSize: 42.0,
                                //underline: SizedBox(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                value: d_choose,
                                onChanged: (newValue) {
                                  setState(() {
                                    d_choose = newValue;
                                  });
                                },
                                items: location.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: TextFormField(
                              controller: cont_regnumController,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.app_registration_sharp,
                                      color: Colors.blueGrey),
                                  labelText: 'Registration Number',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blueGrey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              onChanged: (value) => _contRegNum = value,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0.5, 0, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '(Government Registration Number)',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: TextFormField(
                              controller: cont_ownameController,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.person,
                                      color: Colors.blueGrey),
                                  labelText: 'Owner\'s Name',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blueGrey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              onChanged: (value) => _contOwName = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 70.0, vertical: 10.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.blueGrey, width: 3),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: DropdownButtonFormField(
                                validator: (value) {
                                  if (value == null) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                hint: Text('Select Num.of Workers'),
                                dropdownColor: Colors.white,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.blue,
                                ),
                                iconSize: 42.0,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                value: w_choose,
                                onChanged: (newValue) {
                                  setState(() {
                                    w_choose = newValue;
                                  });
                                },
                                items: workers.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: cont_passwordController,
                              obscureText: !_passwordVisible,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  labelText: 'Create Password ',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blueGrey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'This field is required';
                                }
                                if (value.trim().length < 8) {
                                  return 'Password must be at least 8 characters in length';
                                }

                                return null;
                              },
                              onChanged: (value) => _contpassword = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: !_passwordVisible,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  labelText: 'Confirm Password',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blueGrey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }

                                if (value != _contpassword) {
                                  return 'Confimation password doesn\'t match';
                                }

                                return null;
                              },
                              onChanged: (value) =>
                                  _contconfirmPassword = value,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: _trySubmitForm,
                              //onPressed: () {

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Select()),
                              // );
                              //},
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),

                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 30.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
