// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/product_methods.dart';
import 'package:group2/common/size.dart';
import 'package:group2/components/image_causerol.dart';
import 'package:group2/components/image_causerol_a.dart';
import 'package:group2/pages/about_setting.dart';
import 'package:group2/pages/loginas_cons.dart';
import 'package:group2/pages/loginpage.dart';
import 'package:group2/src/ui/Bricks.dart';
import 'package:group2/src/ui/Cement.dart';
import 'package:group2/src/ui/Sand.dart';
import 'package:group2/src/ui/Steel.dart';



class SP_HomeScreen extends StatefulWidget {
  @override
  _SP_HomeScreenState createState() => _SP_HomeScreenState();
}

class _SP_HomeScreenState extends State<SP_HomeScreen>{

Map<String, dynamic> data = {
    "isRegisted": true,

    "tags": [
    {
      "image":  'assets/imgs/brush.jpg',
      "name":"Brush",
      "hardware": "Perera Hardware, Maharagama",
      "brand":"Fine Brsuh",
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

  @override
  Widget build(BuildContext context) {
    // TabController _tabController = TabController(length: 2, vsync: this);
    return MaterialApp(
      home: Scaffold(
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
                               Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => Loginas_cons()),
                                   );
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
                   preferredSize:Size.fromHeight(kPropHeight(context, 0.15)),
                   child: Column(
                     children: [
                       Container(
                       margin: const EdgeInsets.only(left: 10, top: 5, right: 200, bottom: 10),
                       child: const Text(
                         "Find Your\nNeed",
                         style: TextStyle(
                             fontFamily: "Poppins",
                             fontSize: 33,
                             fontWeight: FontWeight.bold,
                             letterSpacing: 2,
                             height: 1.15),
                       )),
                       
                     ],
                   ),
                 ),
                   
         ),
           body: SafeArea(  
             //body
             child: SingleChildScrollView(
              child: Column(
                    children: [
                 Container(
                   width: kPropWidth(context, 1),
                   height: kPropHeight(context, 1),
                   padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 0.0),
                   child: Column(
                     children: [
                       Container(
                         //search 
                         margin:const EdgeInsets.all(20) ,
                         child: Container(
                           padding: const EdgeInsets.only(right: 5,left:5),
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
                                           
                                         hintText: 'Search Item...',
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
                             ),
                       Container(
                         //category title
                         child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                           Container(
                             padding: const EdgeInsets.symmetric(vertical: 11.0,horizontal: 25.0),
                             child: const Text(
                               "Categories",
                               textAlign: TextAlign.left,
                               style: TextStyle(
                                   fontFamily: "Poppins",
                                   fontSize: 15,
                                   fontWeight: FontWeight.bold,
                                   height: 1.15),
                             ),
                           ),
                           
                             ]),
                           ),         
                       Container( 
                         child: Column(
                           children: [
                             Container(
                               //row1
                               child: Row(
                                 children: [
                                   Container(
                                     //Cement
                                     margin: const EdgeInsets.fromLTRB(25, 10, 10, 15),
                                         width: kPropWidth(context, 0.4),
                                         height: kPropHeight(context, 0.08),
                                         
                                         // margin: EdgeInsets.only( right:20,top: 15),
                                         decoration: BoxDecoration(
                                           color: Colors.white,
                                           //  border: Border.all(width: 2, color: Colors.grey.shade200),
                                           borderRadius: const BorderRadius.all(Radius.circular(20)),
                                             boxShadow: [
                                               BoxShadow(
                                                 color: Colors.grey.withOpacity(0.25),
                                                 spreadRadius: 10,
                                                 blurRadius: 7,
                                                 offset: const Offset(2, 5), // changes position of shadow
                                               ),
                                               BoxShadow(
                                                 color: Colors.white.withOpacity(0.8),
                                                 spreadRadius: 10,
                                                 blurRadius: 7,
                                                 offset: const Offset(-10, -10), // changes position of shadow
                                               ),
                                             ],
                                            
                                         ),


                                     child: Container(
                                     //cement
                                     width: kPropWidth(context, 0.4),
                                     height: kPropHeight(context, 0.08),
                                     decoration: BoxDecoration(
                                        image: const DecorationImage(
                                             image: AssetImage("assets/imgs/cement.jpg"),
                                             fit: BoxFit.cover,     
                                             ),
                                             borderRadius: BorderRadius.circular(20.0)
                                     ),
                                     
                                     child: ElevatedButton(
                                       
                                       onPressed: () async {
                                         await ProductMethods().getCementProduct().then((val){
                                           if(val.data['success']){
                                             data['tags']=val.data['products'];
                                           }else{
                                             Fluttertoast.showToast(
                                                 msg: val.data['msg'],
                                                 toastLength: Toast.LENGTH_SHORT,
                                                 gravity: ToastGravity.BOTTOM,
                                                 backgroundColor: Colors.red,
                                                 textColor: Colors.white,
                                                 fontSize: 16.0);
                                           }
                                         });
                                           Navigator.push(
                                             context,
                                             MaterialPageRoute(builder: (context) => cement(context: context,  tags: data['tags'],)),
                                           );
                                           
                                         },
                                         child: const Text("Cement",
                                         style: TextStyle(
                                           fontFamily: "Poppins",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 25,
                                           color: Colors.white),),
                                         
                                         style: ElevatedButton.styleFrom(
                                          
                                           primary: Colors.white12,
                                           // shadowColor: Colors. transparent,
                                           padding: const EdgeInsets.symmetric(
                                             vertical: 0.0, horizontal: 0.0),
                                             
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(20.0),
                                               
                                             ),
                                           ), 
                                     ),
                                       ),
                                   ),
                                   Container(
                                     //Bricks
                                     margin: const EdgeInsets.fromLTRB(12, 10, 22, 15),
                                         width: kPropWidth(context, 0.4),
                                         height: kPropHeight(context, 0.08),
                                         
                                         // margin: EdgeInsets.only( right:20,top: 15),
                                         decoration: BoxDecoration(
                                           color: Colors.white,
                                           //  border: Border.all(width: 2, color: Colors.grey.shade200),
                                           borderRadius: const BorderRadius.all(Radius.circular(20)),
                                             boxShadow: [
                                               BoxShadow(
                                                 color: Colors.grey.withOpacity(0.25),
                                                 spreadRadius: 10,
                                                 blurRadius: 7,
                                                 offset: const Offset(2, 5), // changes position of shadow
                                               ),
                                               BoxShadow(
                                                 color: Colors.white.withOpacity(0.8),
                                                 spreadRadius: 10,
                                                 blurRadius: 7,
                                                 offset: const Offset(-10, -10), // changes position of shadow
                                               ),
                                             ],
                                         ),


                                     child: Container(
                                         //bricks
                                         width: kPropWidth(context, 0.4),
                                         height: kPropHeight(context, 0.08),
                                         decoration: BoxDecoration(
                                      image: const DecorationImage(
                                           image: AssetImage("assets/imgs/bricks.jpg"),
                                           fit: BoxFit.cover,     
                                           ),
                                           borderRadius: BorderRadius.circular(20.0)
                                         ),
                                         child: ElevatedButton(
                                     onPressed: () async {
                                       await ProductMethods().getBricksProduct().then((val){
                                         if(val.data['success']){
                                           data['tags']=val.data['products'];
                                         }else{
                                           Fluttertoast.showToast(
                                               msg: val.data['msg'],
                                               toastLength: Toast.LENGTH_SHORT,
                                               gravity: ToastGravity.BOTTOM,
                                               backgroundColor: Colors.red,
                                               textColor: Colors.white,
                                               fontSize: 16.0);
                                         }
                                       });
                                         Navigator.push(
                                           context,
                                           MaterialPageRoute(builder: (context) => brick(context: context,  tags: data['tags'],)),
                                         );
                                       },
                                       child: const Text("Bricks",
                                         style: TextStyle(
                                           fontFamily: "Poppins",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 25,
                                           color: Colors.white),),


                                       style: ElevatedButton.styleFrom(
                                         
                                         primary: Colors.white12,
                                         // shadowColor: Colors. transparent,
                                         padding: const EdgeInsets.symmetric(
                                           vertical: 0.0, horizontal: 0.0),
                                           shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(20.0),
                                           ),
                                         ),
                                         ),
                                       ),
                                   )
                                 
                                 ],
                               ),
                             ),
                             Container(
                               //row2
                               child: Row(
                                 children: [
                                   Container(
                                     //steel
                                     margin: const EdgeInsets.fromLTRB(25, 15, 10, 20),
                                         width: kPropWidth(context, 0.4),
                                         height: kPropHeight(context, 0.08),
                                         
                                         // margin: EdgeInsets.only( right:20,top: 15),
                                         decoration: BoxDecoration(
                                           color: Colors.white,
                                           //  border: Border.all(width: 2, color: Colors.grey.shade200),
                                           borderRadius: const BorderRadius.all(Radius.circular(20)),
                                             boxShadow: [
                                               BoxShadow(
                                                 color: Colors.grey.withOpacity(0.25),
                                                 spreadRadius: 10,
                                                 blurRadius: 7,
                                                 offset: const Offset(2, 5), // changes position of shadow
                                               ),
                                               BoxShadow(
                                                 color: Colors.white.withOpacity(0.8),
                                                 spreadRadius: 10,
                                                 blurRadius: 7,
                                                 offset: const Offset(-10, -10), // changes position of shadow
                                               ),
                                             ],
                                         ),


                                     child: Container(
                                         //steel
                                         width: kPropWidth(context, 0.4),
                                         height: kPropHeight(context, 0.08),
                                         decoration: BoxDecoration(
                                      image: const DecorationImage(
                                           image: AssetImage("assets/imgs/stee.jpg"),
                                           fit: BoxFit.cover,     
                                           ),
                                           borderRadius: BorderRadius.circular(20.0)
                                         ),
                                         child: ElevatedButton(
                                     onPressed: () async {
                                       await ProductMethods().getSteelProduct().then((val){
                                         if(val.data['success']){
                                           data['tags']=val.data['products'];
                                         }else{
                                           Fluttertoast.showToast(
                                               msg: val.data['msg'],
                                               toastLength: Toast.LENGTH_SHORT,
                                               gravity: ToastGravity.BOTTOM,
                                               backgroundColor: Colors.red,
                                               textColor: Colors.white,
                                               fontSize: 16.0);
                                         }
                                       });
                                         Navigator.push(
                                           context,
                                           MaterialPageRoute(builder: (context) =>steel(context: context,  tags: data['tags'],)),
                                         );
                                       },
                                       child: const Text("Steel",
                                         style: TextStyle(
                                           fontFamily: "Poppins",
                                           fontWeight: FontWeight.bold,
                                           fontSize: 25,
                                           color: Colors.white),),

                                           
                                       style: ElevatedButton.styleFrom(
                                         
                                         primary: Colors.white12,
                                         shadowColor: Colors. transparent,
                                         padding: const EdgeInsets.symmetric(
                                           vertical: 0.0, horizontal: 0.0),
                                           shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(20.0),
                                           ),
                                         ),
                                         ),
                                       ),
                                   ),
                                   Container(
                                     //sand
                                     margin: const EdgeInsets.fromLTRB(12, 15, 22, 20),
                                         width: kPropWidth(context, 0.4),
                                         height: kPropHeight(context, 0.08),
                                         
                                         // margin: EdgeInsets.only( right:20,top: 15),
                                         decoration: BoxDecoration(
                                           color: Colors.white,
                                           //  border: Border.all(width: 2, color: Colors.grey.shade200),
                                           borderRadius: const BorderRadius.all(Radius.circular(20)),
                                             boxShadow: [
                                               BoxShadow(
                                                 color: Colors.grey.withOpacity(0.25),
                                                 spreadRadius: 10,
                                                 blurRadius: 7,
                                                 offset: const Offset(2, 5), // changes position of shadow
                                               ),
                                               BoxShadow(
                                                 color: Colors.white.withOpacity(0.8),
                                                 spreadRadius: 10,
                                                 blurRadius: 7,
                                                 offset: const Offset(-10, -10), // changes position of shadow
                                               ),
                                             ],
                                         ),


                                     child: Container(
                                        //sand
                                         width: kPropWidth(context, 0.4),
                                         height: kPropHeight(context, 0.08),
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                                image: AssetImage("assets/imgs/sand.jpg"),
                                                fit: BoxFit.cover,     
                                                ),
                                                borderRadius: BorderRadius.circular(20.0)
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await ProductMethods().getSandProduct().then((val){
                                              if(val.data['success']){
                                                data['tags']=val.data['products'];
                                              }else{
                                                Fluttertoast.showToast(
                                                    msg: val.data['msg'],
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.BOTTOM,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            });
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => sand(context: context,  tags: data['tags'],)),
                                              );
                                            },
                                            child: const Text("Sand",
                                               style: TextStyle(
                                                 fontFamily: "Poppins",
                                                 fontWeight: FontWeight.bold,
                                                 fontSize: 25,
                                                 color: Colors.white),),
                                            style: ElevatedButton.styleFrom(
                                              
                                              primary: Colors.white10,
                                              // shadowColor: Colors. transparent,
                                              padding: const EdgeInsets.symmetric(
                                                vertical: 0.0, horizontal: 0.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20.0),
                                                ),
                                              ), 
                                        ),
                                       ),
                                   )
                                 
                                 ],
                               ),
                             )
                           
                           ],),
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
                                       "Most Popular Items",
                                       textAlign: TextAlign.left,
                                       style: TextStyle(
                                           fontFamily: "Poppins",
                                           fontSize: 15,
                                           fontWeight: FontWeight.bold,
                                           height: 1.15),
                                     ),
                                   ),
                                  
                                     ]),
                                   ),         
                               Container( 
                                 child: ImageCauserol(
                                     context: context,
                                       tags: data['tags'],
                                       
                                     ),
                               ),
                                     ],
                                   ),
                                 ),
                       Container(
                         //this week best offers
                         child: Column(
                           children: [
                               Container(
                                 child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Container(
                                       padding: const EdgeInsets.symmetric(vertical: 11.0,horizontal: 25.0),
                                       child: const Text(
                                           "This Week best offers",
                                           textAlign: TextAlign.left,
                                           style: TextStyle(
                                               fontFamily: "Poppins",
                                               fontSize: 15,
                                               fontWeight: FontWeight.bold,
                                               height: 1.15),
                                         ),
                                       ),
                                  
                                 ]),
                           ),
                         
                               Container(
                                 
                                 child: ImageCauserol_a(
                                     context: context,
                                       tags: data['tags'],
                                     ),
                               ),
                               ],
                         ),
                       ),
                       
                       
                       ],
                   ),
                       
                 ),
                 
               ],
           
              ),
             ),
               ),
       
        ),
     
      );
  }
}