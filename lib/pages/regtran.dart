import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/authenticate_service.dart';

class RegTran extends StatefulWidget {
  const RegTran({Key? key}) : super(key: key);

  @override
  State<RegTran> createState() => _RegTranState();
}

class _RegTranState extends State<RegTran> {
  var t_choose;
  List transport = ["Yes", "No", "No,but may be in future"];
  var v_choose;
  List vehicle = [
    "Small Lorry",
    "Lorry",
    "Truck",
    "ThreeWheeler",
    "Motor Bike",
    "Van",
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

  String _tranEmail = '';
  String _tranName = '';
  String _tranpassword = '';
  String _tranconfirmPassword = '';
  String _tranConNum = '';
  String _tranAddress = '';
  String _tranTown = '';
  String _tranDistrict = '';
  String _tranTransport = '';
  String _tranVehicle = '';

  Future<void> _trySubmitForm() async {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_tranEmail);
      debugPrint(_tranName);
      debugPrint(_tranpassword);
      debugPrint(_tranconfirmPassword);
      debugPrint(_tranConNum);
      debugPrint(_tranAddress);
      debugPrint(_tranTown);
      debugPrint(_tranDistrict);
      debugPrint(_tranVehicle);
      debugPrint(_tranTransport);

      try{
         await AuthService().addTransporter(_tranName, _tranEmail, _tranConNum, _tranAddress, _tranTown, _tranDistrict, _tranVehicle, _tranTransport, _tranpassword).then((val){
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
      catch(e){
        print('An error occured');
      }
    }
  }

  @override
  final tran_emailController = TextEditingController();
  final tran_usernameController = TextEditingController();
  final tran_connumController = TextEditingController();
  final tran_addressController = TextEditingController();
  final tran_hmtownController = TextEditingController();
  final tran_districtController = TextEditingController();
  final tran_passwordController = TextEditingController();
  final tran_vehicleController = TextEditingController();
  final lab_transportController = TextEditingController();
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
                image: AssetImage("assets/imgs/bg4.png"),
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
                              controller: tran_usernameController,
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
                              onChanged: (value) => _tranName = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0),
                            child: TextFormField(
                              controller: tran_emailController,
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
                              onChanged: (value) => _tranEmail = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0),
                            child: TextFormField(
                              controller: tran_connumController,
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
                              onChanged: (value) => _tranConNum = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: TextFormField(
                              controller: tran_addressController,
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
                              onChanged: (value) => _tranAddress = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: TextFormField(
                              controller: tran_hmtownController,
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
                              onChanged: (value) => _tranTown = value,
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
                                    _tranDistrict=d_choose;
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
                                horizontal: 60.0, vertical: 10.0),
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
                                hint: Text('Select Vehicle Type'),
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
                                value: v_choose,
                                onChanged: (newValue) {
                                  setState(() {
                                    v_choose = newValue;
                                    _tranVehicle=v_choose;
                                  });
                                },
                                items: vehicle.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0.5, 0, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '* Do you provide your services out of your district?',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
                                //onChanged: (value) => _userDistrict = value,
                                hint: Text('Select Your Choice'),
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
                                value: t_choose,
                                onChanged: (newValue) {
                                  setState(() {
                                    t_choose = newValue;
                                    _tranTransport=t_choose;
                                  });
                                },
                                items: transport.map((valueItem) {
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
                              controller: tran_passwordController,
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
                              onChanged: (value) => _tranpassword = value,
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

                                if (value != _tranpassword) {
                                  return 'Confimation password doesn\'t match';
                                }

                                return null;
                              },
                              onChanged: (value) =>
                                  _tranconfirmPassword = value,
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
