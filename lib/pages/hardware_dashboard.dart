// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/product_methods.dart';
import 'package:group2/common/size.dart';
import 'package:group2/components/image_causerol.dart';
import 'package:group2/components/image_causerol_b.dart';
import 'package:group2/pages/about_setting.dart';
import 'package:group2/pages/additem.dart';
import 'package:group2/pages/loginas_cons.dart';

import '../globals.dart';

class HrdDashboard extends StatefulWidget {
  const HrdDashboard({Key? key}) : super(key: key);

  @override
  State<HrdDashboard> createState() => _HrdDashboardState();
}

class _HrdDashboardState extends State<HrdDashboard> {

  Map<String, dynamic> data = {
    "isRegisted": true,

    "tags": [
      {
        "image":  'assets/imgs/brush.jpg',
        "name":"Brush",
        "hardware": "Perera Hardware, Maharagama",
        "brand":"Fine",
        "discount":"5%",

      },
      {
        "image":  'assets/imgs/stee.jpg',
        "name":"Steel",
        "hardware": "Rathna Hardware, Dehiwala",
        "brand":"Melwa Steel",
        "discount":"15%",
      },
      {
        "image":  'assets/imgs/cement.jpg',
        "name":"Cement1",
        "hardware": "Balaji Hardware, Colombo-06",
        "brand":"Lanwa Cement",
        "discount":"10% ",
      },
      {
        "image":  'assets/imgs/cement.png',
        "name":"Cement2",
        "hardware": "ANC Hardware, Matara",
        "brand":"Sanstha Cement",
        "discount":"10% ",
      },
      {
        "image":  'assets/imgs/logo.png',
        "name":"Logo",
        "hardware": "S & S Hardware, Mount Lavinia",
        "brand":"Mascot Logo",
        "discount":"20%",
      },
    ],
  };

  // @override
  // initState(){
  //   super.initState();
  //
  //   gettingProducts();
  // }
  // //
  Future<List<dynamic>?> gettingProducts() async {
   var results= await ProductMethods().getHardwareProduct(sp['_id']);
      if(results.data['success']){
        return results.data['products'];
      }else{
        Fluttertoast.showToast(
            msg: results.data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(

                      backgroundColor: const Color(0xE5E5E5),
                      elevation: 0,    
                      
                      actions: [
                        
                           PopupMenuButton(
                             // add icon, by default "3 dot" icon
                              icon: Icon(Icons.menu_rounded,color: Colors.black87,size: 28,),
                              // position: ,                   
                              itemBuilder: (context){
                                                     
                                return [
                                  
                                        PopupMenuItem<int>(
                                            value: 0,
                                            child: Text("About and Settings"),
                                        ),

                                        PopupMenuItem<int>(
                                            value: 1,
                                            child: Text("Logout"),
                                        ),

                                        
                                    ];
                              },
                              onSelected:(value){
                                  if(value == 0){
                                    Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => About()),
                                        );
                                  }else if(value == 1){
                                    Navigator.pushNamedAndRemoveUntil(context, '/SPLogin', (route) => false);
                                  }
                              }
                              ),

                      ],
                      leading: Container(
                        margin: const EdgeInsets.only(left: 18, top: 12, bottom: 10),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/imgs/logo.png'),
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize:Size.fromHeight(kPropHeight(context, 0.1)),
                        child: Column(
                          children: [
                            Container(
                            margin: const EdgeInsets.only(left: 20, top: 5, right: 200, bottom: 10),
                            child: const Text(
                              "Dashboard",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 30.5,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  height: 1.15),
                            )),
                            
                          ],
                        ),
                      ),
                    ),
      body: SafeArea(
        
        child: SingleChildScrollView(
            child: Column(
              children: [
                     Container(
                       margin:const EdgeInsets.all(20) ,
                       child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: TextField(
                                style: const TextStyle( height: 0.5 ),
                                  cursorColor: Colors.grey,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(right: 15,left: 18),
                                      fillColor: Colors.white,
                                      filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide.none
                                          
                                        ),
                                        
                                      hintText: 'Search Ad...',
                                      hintStyle: const TextStyle(
                                        
                                        fontFamily: 'Poppins',
                                        color: Colors.grey,
                                        fontSize: 16
                                      ),
                                    ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only (left: 10),
                              padding: const EdgeInsets.only(right:5,left: 5),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: IconButton(
                                    icon: const Icon(Icons.search, color: Colors.white),                                  
                                    onPressed: () {
                                      print("b"); 
                                    },
                                  ),
                            ),
                          ],
                        ),
                     ),
                      Container(
                                //most pop
                                child: Column(
                                  children: [
                                      Container(
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 11.0,horizontal: 25.0),
                                            child: const Text(
                                              "Published Ads",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.15),
                                            ),
                                          ),
                                         
                                            ]),
                                          ),         
                                      Container( 
                                        child: FutureBuilder<List<dynamic>?>(
                                          future: gettingProducts(),
                                          builder: (context,AsyncSnapshot<List<dynamic>?> snapshot){
                                            if(snapshot.hasData){
                                              return ImageCauserol_b(
                                                tags: snapshot.data!,

                                              );
                                            }else{
                                              return CircularProgressIndicator();
                                            }
                                          },
                                        )
                                      ),
                                            ],
                                          ),
                                        ),
              ],
            ),
                  
      )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
             Navigator.pushNamed(
                  context,'/addProduct'
                );
          },
          label: Text('Post Ad ',
          style: TextStyle(
             fontFamily: "poppins",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              // height: 1.15
          ),
          ),
          icon: const Icon(Icons.add_a_photo_rounded),
          backgroundColor: Color.fromRGBO(0, 207, 108, 1),
      ),
    );
  }
}
