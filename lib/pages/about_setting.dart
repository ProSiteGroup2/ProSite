//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  var lchoose;
  List location=[
    "Colombo","Gampaha","Kalutara","Kandy","Matale","Nuwara Eliya","Galle","Matara","Hambantota","Jaffna","Kilinochchi","Mannar","Vavuniya","Mullaitivu","Batticaloa","Ampara","Tricomalee","Kurunegala","Anuradhapura","Puttlam","Polonnaruwa","Badulla","Monaragala","Ratnapura","Kegalle"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20.0,20.0,0,0),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 27.0,),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0,0,0,0),
                child: Text(
                  'Select your location',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color:Colors.black87,
                  ),
                ),
              ),
              SizedBox(height:10.0),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border:Border.all(color:Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: DropdownButton(
                    hint: Text('       select'),
                    dropdownColor: Colors.blue[300],
                    icon: Icon(Icons.arrow_drop_down,
                    color: Colors.blue[700],),
                    iconSize: 42.0,
                    underline: SizedBox(),
                    style:TextStyle(
                      color:Colors.black,
                      fontSize: 17.0,
                    ),
                    value: lchoose,
                    onChanged: (newValue){
                      setState(() {
                        lchoose=newValue;
                      });
                    },
                    items: location.map((valueItem){
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 19.0,),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0,0,0,0),
                child: Text(
                  'About',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0,8.0,0,0),
                child: Text('A confidentiality agreement (also called a nondisclosure agreement or NDA) is a legally binding contract in which a person or business promises to treat specific information as a trade secret and promises not to disclose the secret to others without proper authorization. ',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontFamily: 'Poppins',
                  fontSize: 12.0,
                ),),
              ),
              SizedBox(height: 27.0,),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0,0,0,0),
                child: Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                    color:Colors.black87,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0,8.0,0,0),
                child: Text('1.By Installing this application("ProSite"),'
                    'you agree to be bound by these terms of use. Please'
                    'review them carefully before installation and/acceptance.'
                    '\n2. All trademarks, copyright, database rights and other'
                  'intellectual property rights of any nature in the application'
                  ' together with the underlying software code are owned by Group2.Inc',
                    style: TextStyle(
                    color: Colors.grey[800],
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                  ),),
              ),
              SizedBox(height:20.0),
              Center(
                child: Text(
                  'Designed by Group2.Inc'
                      '\nApp Version : 1.0.0.1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
