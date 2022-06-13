
import 'package:flutter/material.dart';

class NewLoginas_cons extends StatefulWidget {
  const NewLoginas_cons({Key? key}) : super(key: key);

  @override
  State<NewLoginas_cons> createState() => _NewLoginas_consState();
}

class _NewLoginas_consState extends State<NewLoginas_cons> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _password = '';
  String _confirmPassword = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_password);
      debugPrint(_confirmPassword);
    }
  }

  @override
  final cons_newpasswordController = TextEditingController();
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
                image: AssetImage("assets/imgs/User Login.png"),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25.0, 10.0, 0),
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
                        "as Consumer",
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF5D5D5D)),
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
                        controller: cons_newpasswordController,
                        obscureText: !_passwordVisible,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          fillColor: Colors.white,
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: 'Enter New Password',
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
                          labelText: 'New Password',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        onChanged: (value) => _password = value,
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
                          child: TextFormField(
                            keyboardType: TextInputType.text,
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
                              hintText: 'Enter Confirm Password',
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
                              labelText: 'Confirm Password',
                            ),
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
                      ]),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: ElevatedButton(
                        //onPressed: () {},
                        onPressed: _trySubmitForm,
                        child: Text(
                          'Submit',
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
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height * 0.35,
                //   child: Stack(
                //     children: [
                //       Positioned(
                //         bottom: -100,
                //         left: 0,
                //         child: Container(
                //           width: MediaQuery.of(context).size.width,
                //           height: MediaQuery.of(context).size.height * 0.5,
                //           child: Image.asset(
                //             "assets/user_pic.jpg",
                //             fit: BoxFit.fitWidth,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
