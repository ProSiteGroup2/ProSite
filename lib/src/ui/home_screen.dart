// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
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



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

Map<String, dynamic> data = {
    "isRegisted": true,
    "for": "Boys",
    'fee': {'per': 'Month', 'cost': 4000},
    'location': {
      'address': "15/1 , ABC Rd, ABC, 11850",
      'lat': 7.526525,
      'lng': 8.265977
    },
    'available': 5,
    'about':
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo velit, iaculis ac diam et, condimentum molestie felis. Curabitur maximus turpis ut vehicula aliquet. Proin vitae eleifend metus Nullam justo velit, iaculis ac diam et, condimentum molestie felis. Curabitur maximus turpis ut vehicula aliquet. Proin vitae eleifend metus",
    'images': [
      'assets/imgs/brush.jpg',
      'assets/imgs/stee.jpg',
      'assets/imgs/cement.jpg',
      'assets/imgs/cement.png',
      'assets/imgs/logo.png',
      
    ],

    'name':[
        "cement",
        "sand",
        "cem1",
        "cem2",
        "sand2",
    ],
    
    'owner': {
      'name': "Rental Surat",
      'who': "Owner",
      'image': "assets/imgs/logo.png",
      'contact_no': "+94750001112"
    },
    'rating': {
      'overall': 4.5,
      'outof': 5,
      'reviews': [
        {
          'avatar': 'assets/imgs/logo.png',
          'user_name': 'ACV IOP',
          'rate': 4.5,
          'review':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo velit, iaculis ac diam et, condimentum molestie felis. Curabitur maximus turpis ut vehicula aliquet. Proin vitae eleifend metus Nullam justo velit, iaculis ac diam et, condimentum molestie felis. Curabitur maximus turpis ut vehicula aliquet. Proin vitae eleifend metus',
        },
        {
          'avatar': 'assets/imgs/logo.png',
          'user_name': 'IOP IOP',
          'rate': 4.6,
          'review': 'Lorem ipsum ',
        },
      ],
    },
    'facilities': [
      {
        'category': 1,
        'type': "Table",
        'amount': 3,
        'description': "",
        'price': 0,
      },
      {
        'category': 2,
        'type': "Hot Shower",
        'amount': 3,
        'description': "",
        'price': 0,
      },
      {
        'category': 3,
        'type': "Breakfest",
        'amount': 3,
        'description': "with 03 curies",
        'price': 120,
      },
      {
        'category': 3,
        'type': "Lunch",
        'amount': 3,
        'description': "with 04 curies",
        'price': 120,
      },
      {
        'category': 4,
        'type': "Breakfest",
        'amount': 3,
        'description':
            "with 03 curieswith 03 curieswith 03 curieswith 03 curieswith 03 curieswith 03 curieswith 03 curies",
        'price': 120,
      }
    ],
    'user': {
      'id': "u1256369554",
      'name': 'USER UIO',
      'image': 'assets/imgs/logo.png'
    }
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
           child:Scaffold(
                appBar: AppBar(

                      backgroundColor: const Color(0xE5E5E5),
                      elevation: 0,    
                      
                      actions: [
                        // Container(
                        //   margin: const EdgeInsets.only(right: 15),
                        //   child: IconButton(
                        //     icon: const Icon(Icons.menu, color: Colors.black),
                        //     onPressed: () {
                        //       print("A");
                        //     },
                        //   ),
                        // )
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
                        preferredSize:Size.fromHeight(kPropHeight(context, 0.2)),
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
                            const TabBar(
                                    labelPadding: EdgeInsets.only(left: 40, right: 40),
                                    
                                    labelColor: Colors.black,
                                    labelStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Poppins"),
                                    unselectedLabelColor: Colors.grey,
                                    isScrollable: true,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    tabs: [Tab(text: "Hardware Items"), Tab(text: "Workers")],
                                  ),
                          ],
                        ),
                      ),
                             
                        // // Container(
                        // //   child: Align(
                        // //     alignment: Alignment.centerLeft,
                            
                        // //   ),
                        // // ),
                        
                       
              
              ),
                body: TabBarView(  
                  //tabbarview
                    children: [
                      Container(
                        width: kPropWidth(context, 1),
                        height: kPropHeight(context, 1),
                        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 0.0),
                        child: SingleChildScrollView(
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
                                                  
                                                hintText: 'Search Category...',
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
                                //Categories
                                child: Column(
                                  children: [
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
                                                      
                                                      onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(builder: (context) => cement(context: context, imgs: data['images'])),
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
                                                    onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) => brick(context: context, imgs: data['images'])),
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
                                                    onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) =>steel(context: context, imgs: data['images'])),
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
                                                         onPressed: () {
                                                             Navigator.push(
                                                               context,
                                                               MaterialPageRoute(builder: (context) => sand(context: context, imgs: data['images'])),
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
                                              imgs: data['images'],
                                              name: data['name'],
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
                                              imgs: data['images'],
                                            ),
                                      ),
                                      ],
                                ),
                              ),
                              
                              
                              ],
                          ),
                        ),
                            
                      ),
                      Container(
                        //workers
                        width: kPropWidth(context, 1),
                        height: kPropHeight(context, 1),
                        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  child: Container(
                                  margin:const EdgeInsets.all(20) ,
                                  //search content
                                  padding: const EdgeInsets.only(right: 5,left:5),
                                  child: Row(
                                    children: [
                                    
                                        Flexible(
                                          // TEXTFIELD
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
                                                
                                              hintText: 'Search Category...',
                                              hintStyle: const TextStyle(
                                                
                                                fontFamily: 'Poppins',
                                                color: Colors.grey,
                                                fontSize: 16
                                              ),
                                            ),
                                      ),
                                    ),
                                    Container(
                                      //search button
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
                                //constructor
                                        child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            //constructor carousal name
                                              Container(
                                                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                                                child: const Text(
                                                 "Contractors",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.15),
                                            ),
                                          ),
                                              Container(
                                                padding: const EdgeInsets.only(right: 30),
                                                child: const Text(
                                                  "See all",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.grey,
                                                      height: 1),
                                                ),
                                              ),
                                            ]),
                                           ),
                              Container(
                                      //constructor car
                                      child: ImageCauserol(
                                        
                                          context: context,
                                            imgs: data['images'],
                                            name: data['name'],
                                          ),
                                    ),       
                              Container(
                              //mason 
                                child: Column(
                                  children: [
                                      Container(
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                            Container(
                                              //mason carousals name
                                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                                              child: const Text(
                                                "Masons",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    height: 1.15),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(right: 30),
                                              child: const Text(
                                                "See all",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey,
                                                    height: 1),
                                              ),
                                            ),
                                          ]),
                                        ),
                          
                                  Container(
                                    //masons carousals
                                    child: ImageCauserol(
                                      
                                        context: context,
                                          imgs: data['images'],
                                          name: data['name'],
                                        ),
                                  ),
                                ],
                              ),
                            ),
                              Container(
                                //elec
                                  child: Column(
                                    children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                //Electrians carousals name
                                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                                              child: const Text(
                                                "Electricians",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    height: 1.15),
                                              ),
                                            ),
                                              Container(
                                                
                                                padding: const EdgeInsets.only(right: 30),
                                                child: const Text(
                                                  "See all",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.grey,
                                                      height: 1),
                                                ),
                                              ),
                                              ]),
                                        ),
                          
                                        Container(
                                          //electrians carousals
                                          child: ImageCauserol(
                                            
                                              context: context,
                                                imgs: data['images'],
                                                name: data['name'],
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                              Container(
                                //plumber
                                child: Column(
                                  children: [
                                    Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                          Container(
                                            //plumber carousals name
                                                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                                                child: const Text(
                                                  "Plumbers",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      height: 1.15),
                                                ),
                                              ),
                                          Container(
                                            padding: const EdgeInsets.only(right: 30),
                                            child: const Text(
                                              "See all",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  height: 1),
                                            ),
                                          ),
                                          ]),
                                    ),
                          
                                    Container(
                                      //elec carousals
                                      child: ImageCauserol(
                                        
                                          context: context,
                                            imgs: data['images'],
                                            name: data['name'],
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            
                            ],
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