

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/authenticate_service.dart';

class RegLab extends StatefulWidget {
  const RegLab({Key? key}) : super(key: key);

  @override
  State<RegLab> createState() => _RegLabState();
}

class _RegLabState extends State<RegLab> {
  var q_choose;
  List qualification = [
    "Only With Experience",
    "With Professional Qualifications",
  ];
  var p_choose;
  List profession = [
    "Mason",
    "Carpenter",
    "Electrician",
    "Plumber",
    "Architecturer",
    "Painter",
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

  String _labEmail = '';
  String _labName = '';
  String _labpassword = '';
  String _labconfirmPassword = '';
  String _labConNum = '';
  String _labAddress = '';
  String _labTown = '';
  String _labDistrict = '';
  String _labProfession = '';
  String _labQualification = '';
  int? _labYears;

  Future<void> _trySubmitForm() async {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_labEmail);
      debugPrint(_labName);
      debugPrint(_labpassword);
      debugPrint(_labconfirmPassword);
      debugPrint(_labConNum);
      debugPrint(_labAddress);
      debugPrint(_labTown);
      debugPrint(_labProfession);
      debugPrint(_labDistrict);
      debugPrint(_labQualification);
      debugPrint('$_labYears');

      await AuthService().addLabour(_labProfession, _labName, _labEmail, _labConNum, _labAddress, _labTown, _labDistrict, _labQualification, _labYears, _labpassword).then((val){
        if(val.data['success']){
          Fluttertoast.showToast(
              msg: val.data['msg'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }else{
          Fluttertoast.showToast(
              msg: val.data['msg'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      });
    }
  }

  @override
  final lab_emailController = TextEditingController();
  final lab_usernameController = TextEditingController();
  final lab_connumController = TextEditingController();
  final lab_addressController = TextEditingController();
  final lab_hmtownController = TextEditingController();
  final lab_districtController = TextEditingController();
  final lab_passwordController = TextEditingController();
  final lab_professionController = TextEditingController();
  final lab_qualificationController = TextEditingController();
  final lab_yearsController = TextEditingController();
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
                image: AssetImage("assets/imgs/bg3.png"),
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
                                horizontal: 70.0, vertical: 10.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
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
                                hint: Text('Select Profession'),
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
                                value: p_choose,
                                onChanged: (newValue) {
                                  setState(() {
                                    p_choose = newValue;
                                    _labProfession=p_choose;
                                  });
                                },
                                items: profession.map((valueItem) {
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
                                horizontal: 10.0, vertical: 0),
                            child: TextFormField(
                              controller: lab_usernameController,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.blueGrey,
                                  ),
                                  labelText: 'User Name',
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
                              onChanged: (value) => _labName = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0),
                            child: TextFormField(
                              controller: lab_emailController,
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

                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }

                                return null;
                              },
                              onChanged: (value) => _labEmail = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0),
                            child: TextFormField(
                              controller: lab_connumController,
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
                              onChanged: (value) => _labConNum = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: TextFormField(
                              controller: lab_addressController,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.add_home_sharp,
                                      color: Colors.blueGrey),
                                  labelText: 'Home address',
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
                              onChanged: (value) => _labAddress = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: TextFormField(
                              controller: lab_hmtownController,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.location_city_rounded,
                                      color: Colors.blueGrey),
                                  labelText: 'Home Town',
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
                              onChanged: (value) => _labTown = value,
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
                                    _labDistrict=d_choose;
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
                                horizontal: 30.0, vertical: 10.0),
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
                                //onChanged: (value) => _userDistrict = value,
                                hint: Text('Select Qualification Type'),
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
                                value: q_choose,
                                onChanged: (newValue) {
                                  setState(() {
                                    q_choose = newValue;
                                    _labQualification=q_choose;
                                  });
                                },
                                items: qualification.map((valueItem) {
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
                                horizontal: 10.0, vertical: 0),
                            child: TextFormField(
                              controller: lab_yearsController,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.calendar_month_sharp,
                                    color: Colors.blueGrey,
                                  ),
                                  labelText: 'Experience(Years)',
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
                                return null;
                              },
                              onChanged: (value) => _labYears = int.parse(value),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: lab_passwordController,
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
                              onChanged: (value) => _labpassword = value,
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

                                if (value != _labpassword) {
                                  return 'Confimation password doesn\'t match';
                                }

                                return null;
                              },
                              onChanged: (value) => _labconfirmPassword = value,
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
