
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/authenticate_service.dart';
import 'package:group2/pages/loginas_cons.dart';

class RegUser extends StatefulWidget {
  const RegUser({Key? key}) : super(key: key);

  @override
  State<RegUser> createState() => _RegUserState();
}

class _RegUserState extends State<RegUser> {
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

  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';
  String _userConNum = '';
  String _userAddress = '';
  String _userTown = '';
  String _userDistrict = '';

  Future<void> _trySubmitForm() async {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_userName);
      debugPrint(_password);
      debugPrint(_confirmPassword);
      debugPrint(_userConNum);
      debugPrint(_userAddress);
      debugPrint(_userTown);
      debugPrint(_userDistrict);

       try {
         AuthService().addConsumer(_userName, _userEmail, _userConNum, _userAddress, _userTown, _userDistrict, _password).then((val){
          if(val.data['success']){
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Registered Successfully'),
                content: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 60,
                ),
                actions: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Loginas_cons()),
                        );
                      },
                      child: Text('Done'),
                    ),
                  )
                ],
              ),
            );
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
       } on Exception catch (e) {
         debugPrint('An error occured');
       }
    }
  }

  @override
  final cons_emailController = TextEditingController();
  final cons_usernameController = TextEditingController();
  final cons_connumController = TextEditingController();
  final cons_addressController = TextEditingController();
  final cons_hmtownController = TextEditingController();
  final cons_districtController = TextEditingController();
  final cons_passwordController = TextEditingController();
  late bool _passwordVisible;
  void initState() {
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/imgs/bg1.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center),
            ),
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
                  height: MediaQuery.of(context).size.height * 0.79,
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
                              controller: cons_usernameController,
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
                              onChanged: (value) => _userName = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0),
                            child: TextFormField(
                              controller: cons_emailController,
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
                              onChanged: (value) => _userEmail = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0),
                            child: TextFormField(
                              controller: cons_connumController,
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
                              onChanged: (value) => _userConNum = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: TextFormField(
                              controller: cons_addressController,
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
                              onChanged: (value) => _userAddress = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: TextFormField(
                              controller: cons_hmtownController,
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
                              onChanged: (value) => _userTown = value,
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
                                    _userDistrict=d_choose;
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
                              keyboardType: TextInputType.text,
                              controller: cons_passwordController,
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
                              onChanged: (value) => _password = value,
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

                                if (value != _password) {
                                  return 'Confimation password doesn\'t match';
                                }

                                return null;
                              },
                              onChanged: (value) => _confirmPassword = value,
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
