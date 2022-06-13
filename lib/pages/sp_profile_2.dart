import 'package:flutter/material.dart';

class SPProfile extends StatefulWidget {
  const SPProfile({Key? key}) : super(key: key);

  @override
  _SPProfileState createState() => _SPProfileState();
}

class _SPProfileState extends State<SPProfile> {
  @override
  List work_images=[
    'work1.png','work2.png','work3.png','work4.png','work5.png','work6.png'
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey[50],
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 8.0,0,0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios_rounded),
                        color: Colors.blueAccent,
                        splashColor: Colors.lightBlueAccent,
                        splashRadius: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                      child: SizedBox(width: 20)),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Text(
                        'Profile Settings',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize:20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: work_images.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height:100,
                            width:100,
                              child: Image.asset('assets/imgs/$work_images[index]'));
                        },
                      ),
                    )
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
