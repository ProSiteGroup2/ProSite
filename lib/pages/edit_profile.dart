import 'package:flutter/material.dart';

class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({Key? key}) : super(key: key);

  @override
  State<MyHomePage3> createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {

  List<String> items =[
    'assets/aaa.jpg',
    'assets/bbb.jpg',
    'assets/ccc.jpeg',
    'assets/ddd.jpg',
    'assets/eee.jpg',
    'assets/kkk.jpg',
    'assets/ppp.jfif',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {  },
          icon:const Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.blueAccent,
        ),
        elevation: 0.0,
        backgroundColor:  Color(
            hexColor('#F0F0F0')
        ),

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
                  borderRadius: const BorderRadius.all(Radius.circular(42.0))
              ),

              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:   [

                        const SizedBox(height: 70.0,),

                        Container(
                            height: 150.0,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.blue,
                            margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: items.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context ,index){
                                  return SizedBox(
                                    height: 130,
                                    width: 120,

                                    child: ClipRRect(
                                      child: Image.asset(items[index],fit: BoxFit.fill,),
                                    ),
                                  );
                                }
                            )
                        ),

                        const SizedBox(height: 10.0,),

                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(hexColor('#1982BD')),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(16.0))
                            ),
                            onPressed: () {  },
                            child: const Text('Add Your Work Here',style:TextStyle(color: Colors.white),),

                          ),
                        ),


                        const SizedBox(height: 20.0,),

                        const Padding(
                          padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'First Name:',
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
                            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                            color: Colors.blueGrey[50],
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 5.0,
                                offset: Offset(8.0,8.0),
                              )
                            ],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                            child: TextField(
                                  cursorColor: Colors.black12,

                            )
                          ),
                        ),

                        const SizedBox(height: 50.0,),

                        const Padding(
                          padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Last Name:',
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
                            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                            color: Colors.blueGrey[50],
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 5.0,
                                offset: Offset(8.0,8.0),
                              )
                            ],
                          ),
                          child: const Padding(
                              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                              child: TextField(
                                cursorColor: Colors.black12,
                              )
                          ),
                        ),

                        const SizedBox(height: 50.0,),

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
                            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                            color: Colors.blueGrey[50],
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 5.0,
                                offset: Offset(8.0,8.0),
                              )
                            ],
                          ),
                          child: const Padding(
                              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                              child: TextField(
                                cursorColor: Colors.black12,
                              )
                          ),
                        ),

                        const SizedBox(height: 50.0,),

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
                            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                            color: Colors.blueGrey[50],
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 5.0,
                                offset: Offset(8.0,8.0),
                              )
                            ],
                          ),
                          child: const Padding(
                              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                              child: TextField(
                                cursorColor: Colors.black12,
                              )
                          ),
                        ),

                        const SizedBox(height: 50.0,),

                        const Padding(
                          padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Home Address:',
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
                            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                            color: Colors.blueGrey[50],
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 5.0,
                                offset: Offset(8.0,8.0),
                              )
                            ],
                          ),
                          child: const Padding(
                              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                              child: TextField(
                                cursorColor: Colors.black12,
                              )
                          ),
                        ),

                        const SizedBox(height: 50.0,),

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
                            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                            color: Colors.blueGrey[50],
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 5.0,
                                offset: Offset(8.0,8.0),
                              )
                            ],
                          ),
                          child: const Padding(
                              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                              child: TextField(
                                cursorColor: Colors.black12,
                              )
                          ),
                        ),

                        const SizedBox(height: 20.0,),

                        Center(
                          child: ElevatedButton.icon(

                            //label: Icon(Icons.lock),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[700],
                                shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(16.0))
                            ),
                            onPressed: () {  },
                            icon: const Text('Changed Password',style:TextStyle(color: Colors.white),),
                            label: const Icon(Icons.lock),
                          ),
                        ),


                        const SizedBox(height: 40.0,),
                      ],
              ),
            ),

            Positioned(
                child: Center(
                  child: SizedBox(

                    height: 107.0,
                    width: 115.0,

                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),

                        child: Image.asset('assets/suplier.jpg',fit: BoxFit.fill,)),
                  ),
                )
            )
          ],
        ),
      ),
    );


  }
}

hexColor(String color){
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor =int.parse(newColor);
  return finalColor;
}
