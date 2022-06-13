
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group2/pages/loginas_cons.dart';
import 'package:group2/pages/reguser.dart';
import 'package:group2/pages/resetpwd_2.dart';

class ResetPwd_1 extends StatefulWidget {
  const ResetPwd_1({Key? key}) : super(key: key);

  @override
  State<ResetPwd_1> createState() => _ResetPwd_1State();
}

class _ResetPwd_1State extends State<ResetPwd_1> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _password = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_password);
    }
  }

  @override
  final cons_emailController = TextEditingController();
  final cons_passwordController = TextEditingController();
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
                image: AssetImage("assets/imgs/tools_3.png"),
                //fit: BoxFit.fill,
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
                      padding: const EdgeInsets.fromLTRB(0, 50.0, 90.0, 0),
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF5D5D5D)),
                      ),
                    ),
                    Container(
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 50),
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
                            onChanged: (value) => _userEmail = value,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginas_cons()),
                              );
                            },
                            child: Text(
                              'Back to Login',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xFF5D5D5D),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _trySubmitForm();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPwd_2()),
                          );
                        },
                        child: Text(
                          'Send',
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
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text('Don\'t have an acoount?'),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegUser()),
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
    );
  }
}
