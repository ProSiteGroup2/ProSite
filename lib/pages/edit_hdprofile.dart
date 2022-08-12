import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group2/pages/additem.dart';
import 'package:group2/pages/hardware_profileview.dart';
import 'package:image_picker/image_picker.dart';
import 'package:group2/globals.dart';
import 'package:http/http.dart' as http;
import 'package:group2/Classes/update_methods.dart';

class Edithdprofile extends StatefulWidget {
  const Edithdprofile({Key? key}) : super(key: key);

  @override
  State<Edithdprofile> createState() => _EdithdprofileState();
}

class _EdithdprofileState extends State<Edithdprofile> {
  List<String> items = [
    'assets/imgs/h1.jpg',
    'assets/imgs/h2.jpg',
    'assets/imgs/h4.jpg',
    'assets/imgs/h5.jpg',
    'assets/imgs/h6.jpg',
  ];

  final TextEditingController _hardwarenameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactnumController = TextEditingController();
  final TextEditingController _hardwareaddressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _regnoController = TextEditingController();
  final TextEditingController _ownerController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hardwarenameController.text = sp['hardwarename'];
    _emailController.text = sp['email'];
    _contactnumController.text = sp['contactNo'];
    _hardwareaddressController.text = sp['address'];
    _cityController.text = sp['city'];
    _districtController.text = sp['district'];
    _regnoController.text = sp['regno'];
    _ownerController.text = sp['owner'];

  }


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

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
                    Container(
                        height: 150.0,
                        //width: MediaQuery.of(context).size.width,
                        //color: Colors.blue,
                        margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        /*padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),*/
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.green[200],
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 130,
                                width: 120,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 10.0, 5.0, 10.0),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      items[index],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            })),
                    const SizedBox(
                      height: 10.0,
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
                          'Add your workshop photes',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(hexColor('#1982BD')),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(16.0))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Additem()),
                          );
                        },
                        child: const Text(
                          'Add Items Post',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Hardware Name:',
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
                            controller: _hardwarenameController,
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
                        'Hardware Address:',
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
                            controller: _hardwareaddressController,
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
                        'City:',
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
                            controller: _cityController,
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
                        'Registation Number:',
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
                            controller: _regnoController,
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
                        'Owners Name:',
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
                            controller: _ownerController,
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
                      child: ElevatedButton.icon(
                        //label: Icon(Icons.lock),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey[700],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(16.0))),
                        onPressed: () {},
                        icon: const Text(
                          'Changed Password',
                          style: TextStyle(color: Colors.white),
                        ),
                        label: const Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(
                      height: 0.0,
                    ),
                    const Divider(
                      height: 20.0,
                      color: Colors.black,
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
            Positioned(
                child: Center(
              child: Stack(children: [
                SizedBox(
                  height: 107.0,
                  width: 115.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: image != null
                          ? Image.file(
                              image!,
                              width: 115.0,
                              height: 107.0,
                              fit: BoxFit.fill,
                            )
                          : Image.asset(
                              'assets/imgs/hshop1.jpg',
                              fit: BoxFit.fill,
                            )),
                ),
                Positioned(
                    bottom: -5.0,
                    right: -5.0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 100.0,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              child: Column(
                                children: [
                                  Text('Choose profile photo'),
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
                                                    BorderRadiusDirectional
                                                        .circular(16.0))),
                                        onPressed: () {
                                          pickImage(ImageSource.gallery);
                                        },
                                        child: const Text(
                                          'Add from galery',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(hexColor('#1982BD')),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(16.0))),
                                        onPressed: () {
                                          pickImage(ImageSource.camera);
                                        },
                                        child: const Text(
                                          'Add from Camera',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ))
              ]),
            ))
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
