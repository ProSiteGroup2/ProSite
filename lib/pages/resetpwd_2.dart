// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use, unnecessary_new, unused_field, non_constant_identifier_names, override_on_non_overriding_member, must_call_super, prefer_final_fields, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/pages/newloginas_cons.dart';

import '../Classes/authenticate_service.dart';

class ResetPwd_2 extends StatefulWidget {
  String contactNo;
  ResetPwd_2({Key? key, required this.contactNo}) : super(key: key);
  @override
  State<ResetPwd_2> createState() => _ResetPwd_2State(contactNo: contactNo);
}

class _ResetPwd_2State extends State<ResetPwd_2> {
  final _formKey = GlobalKey<FormState>();
  String contactNo;
  String _userEmail = '';
  String _password = '';
  String _userConNum = '';
  String _otp = '';
  String otp_1 = '';
  String otp_2 = '';
  String otp_3 = '';
  String otp_4 = '';

  _ResetPwd_2State({required this.contactNo}) {
    this._userConNum = contactNo;
  }

  bool? _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_password);
      debugPrint(_userConNum);
      debugPrint(_otp);

      try {
        AuthService().otpVerify(_userConNum, _otp).then((val) {
          if (val.data['success']) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('OTP verified'),
                content: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 60,
                ),
              ),
            );
            return true;
          } else {
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
    return isValid;
  }

  @override
  final cons_emailController = TextEditingController();
  final cons_passwordController = TextEditingController();
  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/imgs/SP Login.png"),
                fit: BoxFit.fill,
                alignment: Alignment.bottomCenter),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50.0, 120.0, 0),
                      child: Text(
                        "Verification",
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF5D5D5D)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 70, 100, 0),
                      child: Container(
                        child: Text(
                          'Enter Verification Code',
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF5D5D5D),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                onChanged: (value) {
                                  otp_1 = value;
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                onSaved: (pin1) {},
                                decoration: InputDecoration(hintText: "0"),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                onChanged: (value) {
                                  otp_2 = value;
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                onSaved: (pin1) {},
                                decoration: InputDecoration(hintText: "0"),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                onChanged: (value) {
                                  otp_3 = value;
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                onSaved: (pin1) {},
                                decoration: InputDecoration(hintText: "0"),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                onChanged: (value) {
                                  otp_4 = value;
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                onSaved: (pin1) {},
                                decoration: InputDecoration(hintText: "0"),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text('If you didn\'t recieve a code'),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Resend',
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
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _otp = otp_1 + otp_2 + otp_3 + otp_4;
                          print(_otp);
                          bool? x = _trySubmitForm();
                          if (x == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewLoginas_cons()),
                            );
                          }
                        },
                        child: Text(
                          'Verify',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 60.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
