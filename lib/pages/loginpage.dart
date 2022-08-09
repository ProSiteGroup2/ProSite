
// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, must_call_super, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/authenticate_service.dart';
import 'package:group2/components/navigation_bar.dart';
import 'package:group2/pages/choose.dart';
import 'package:group2/pages/loginas_cons.dart';
import 'package:group2/pages/resetpwd_1.dart';
import 'package:group2/globals.dart';

import 'package:group2/pages/static.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _spEmail = '';
  String _sppassword = '';
  var token;



  Future<void> _trySubmitForm() async {
    final bool? isValid = _formKey.currentState?.validate();

    if (isValid == true) {
      setLog();
      debugPrint('Everything looks good!');
      debugPrint(_spEmail);
      debugPrint(_sppassword);

      try {
        await AuthService().SPLogin(_spEmail, _sppassword).then((val){
          if (val.data['success']) {
            token = val.data['token'];
            if(val.data['role']=='labour'){
              AuthService().getLabourInfo(token).then((val2){
                if (val2.data['success']){
                  sp=val2.data['sp'];
                  // print(sp['profession']);
                  Fluttertoast.showToast(
                      msg: val2.data['msg'],
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.pushNamed(context, '/labourNavBar');
                }
              });
            }else if(val.data['role']=='contractor'){
              AuthService().getContractorInfo(token).then((val2){
                if (val2.data['success']){
                  sp=val2.data['sp'];
                  Fluttertoast.showToast(
                      msg: val2.data['msg'],
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.pushNamed(context, '/contractorNavBar');
                }
              });
            }else if(val.data['role']=='hardware'){
              AuthService().getHardwareInfo(token).then((val2){
                if (val2.data['success']){
                  sp=val2.data['sp'];
                  Fluttertoast.showToast(
                      msg: val2.data['msg'],
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.pushNamed(context, '/hdNavBar');
                }
              });
            }else if(val.data['role']=='transporter'){
              AuthService().getTransporterInfo(token).then((val2){
                if (val2.data['success']){
                  sp=val2.data['sp'];
                  Fluttertoast.showToast(
                      msg: val2.data['msg'],
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.pushNamed(context, '/transporterNavBar');
                }
              });
            }
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
  final sp_emailController = TextEditingController();
  final sp_passwordController = TextEditingController();
  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/imgs/SP Login.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0,left: 20),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios_new),
                              onPressed: (){
                                Navigator.pushNamedAndRemoveUntil(context, '/select', (route) => false);
                              },
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 40.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF5D5D5D)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: Text(
                          "as Service Provider",
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 25.0,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF5D5D5D)),
                        ),
                      ),
                      Container(
                        child: Column(children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: const Offset(10, 12),
                                ),
                              ],
                            ),
                            // color: Colors.transparent,
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                fillColor: Colors.white,
                                filled: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintText: 'Enter Email Address',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                prefixIcon:
                                    const Icon(Icons.mail, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: 'Email Address',
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your email address';
                                }

                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }

                                return null;
                              },
                              onChanged: (value) => _spEmail = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: const Offset(10, 12),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: sp_passwordController,
                              obscureText: !_passwordVisible,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                fillColor: Colors.white,
                                filled: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintText: 'Enter Password',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
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
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              onChanged: (value) => _sppassword = value,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResetPwd_1()),
                                  );
                                },
                                child: Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFF5D5D5D),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      Center(
                        child: ElevatedButton(
                          //onPressed: () {},
                          onPressed: _trySubmitForm,
                          child: Text(
                            'Login',
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
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text('Don\'t have an account?'),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Choose()),
                                );
                              },
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
