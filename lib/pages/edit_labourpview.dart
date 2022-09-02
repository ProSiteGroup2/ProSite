import 'package:flutter/material.dart';

class Editlabour extends StatefulWidget {
  Map<String, dynamic> data;
  Editlabour(this.data);

  @override
  State<Editlabour> createState() => _EditlabourState();
}

class _EditlabourState extends State<Editlabour> {
  List<String> items = [
    'assets/imgs/aaa.jpg',
    'assets/imgs/bbb.jpg',
    'assets/imgs/ccc.jpeg',
    'assets/imgs/ddd.jpg',
    'assets/imgs/eee.jpg',
    'assets/imgs/kkk.jpg',
    'assets/imgs/ppp.jfif',
  ];

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactnumController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _hometwonController = TextEditingController();
  final TextEditingController _qulificationController =TextEditingController();
  final TextEditingController _experienceController =TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController.text = widget.data['username'];
    _professionController.text = widget.data['profession'];
    _emailController.text = widget.data['email'];
    _contactnumController.text = widget.data['contactNo'];
    _addressController.text = widget.data['address'];
    _hometwonController.text = widget.data['hometown'];
    _districtController.text = widget.data['district'];
    _qulificationController.text = widget.data['qualification'];
    _experienceController.text = widget.data['experience'];
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
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
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
                        'Profession:',
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
                            controller: _professionController,
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
                        'Qualification:',
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
                            controller: _qulificationController,
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
                        'Work Experience:',
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
                            controller: _experienceController,
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
                        onPressed: () {},
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

          ],
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
