// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                color: Colors.blue[50],
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_rounded),
                        color: Colors.black,
                        splashColor: Colors.lightBlueAccent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/imgs/pro1.jpg'),
                        radius: 30.0,
                      ),
                    ),
                    Text(
                      'W.Krishan Perera',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // IconButton(
                    //     onPressed: (){},
                    //     icon: Icon(),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
