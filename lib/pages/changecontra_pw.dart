import 'package:flutter/material.dart';
import '../Classes/update_methods.dart';

class Changecontra_pw extends StatefulWidget {
  const Changecontra_pw({Key? key}) : super(key: key);

  @override
  State<Changecontra_pw> createState() => _Changecontra_pwState();
}

class _Changecontra_pwState extends State<Changecontra_pw> {
  String error = '';
  final TextEditingController _oldpwControler = TextEditingController();
  final TextEditingController _newpwControler = TextEditingController();
  final TextEditingController _confirmnewpwControler = TextEditingController();

  //String url = 'https://prositegroup2.herokuapp.com';
  String url = 'http://10.0.2.2:5000';

  Future<void> savechanges(String oldpw, String newpw)async {
    Map<String,dynamic> data = {
      "password" : oldpw,
      "newPassword":newpw,
    };

    try{
      await UpdateServices().updatePw('$url/changeContractorPw',data);
      Navigator.pop(context);
    }
    catch(err){
      print(err.toString());
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          //height: 500.0,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(hexColor('#FEFEFE')),
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                  child: Text(
                    'Old Password:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
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
                        controller: _oldpwControler,
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
                  height: 15.0,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                  child: Text(
                    'New Password:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
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
                        controller: _newpwControler,
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
                  height: 15.0,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                  child: Text(
                    'Confirm New Password:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
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
                        controller: _confirmnewpwControler,
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
                              BorderRadiusDirectional.circular(16.0))),
                      onPressed: () async{
                        if(_formkey.currentState!.validate()){
                          if(_newpwControler.text == _confirmnewpwControler.text){
                            await savechanges(
                                _oldpwControler.text,
                                _newpwControler.text
                            );
                          }else{
                            setState(() {
                              error ="Not match new password";
                            });
                          }
                        }
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(hexColor('#1982BD')),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadiusDirectional.circular(16.0))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),

                error !=''?Text(error):Container()

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
