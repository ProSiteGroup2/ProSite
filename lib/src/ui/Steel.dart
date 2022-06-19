// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:group2/common/size.dart';
import 'package:group2/src/ui/item_details.dart';
//import '../common/color.dart';


// ignore: must_be_immutable
class steel extends StatefulWidget {
  BuildContext context;
  List<dynamic> imgs;

  steel({Key? key, required this.context, required this.imgs})
      : super(key: key);

  @override
  State<steel> createState() =>
      // ignore: no_logic_in_create_state
      _steelState(context: context, imgs: imgs);
}

class _steelState extends State<steel> {
  int photo = 1;

  @override
  BuildContext context;
  List<dynamic> imgs;

  _steelState({required this.context, required this.imgs});

  final ScrollController _scrollController = ScrollController();

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Steel",style: TextStyle(fontFamily: "Poppins",color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold) ),
        leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ), 
        backgroundColor: Colors.blueGrey[200],
      ),
      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Column(
            children: [
               Container(
                //image box
                width: kPropWidth(context, 1) - 20,
                height: kPropHeight(context, 0.40) - 32,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: Offset(1, 4), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: Offset(-10, -10), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("assets/imgs/stee.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
                
              
              
                 Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.bottomCenter,
                    width: kPropWidth(context, 1) ,
                    height:kPropHeight(context, 1),
                    child: ListView.builder(
                      
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        itemCount: imgs.length,
                        itemBuilder: (context, i) {
                          return Container(
                                        
                                        margin: const EdgeInsets.all(20),
                                        width: 250,
                                        height: 100,
                                        
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
                                        child: ElevatedButton(
                                              
                                            onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) =>const ItemDetails()),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  
                                                  primary: Colors.white,
                                                  shadowColor: Colors.grey.withOpacity(0.25),
                                                  padding: const EdgeInsets.symmetric(
                                                    vertical: 0.0, horizontal: 0.0),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20.0),
                                                    ),
                                                  ), 
                                            
                                
                    
                                          child: Row(
                                            children: [
                                              Container(
                                                //image
                                                alignment: Alignment.centerLeft,
                                                width: 110,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  border: Border.all(width: 1, color: Colors.grey.shade200),
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: Colors.white,
                                                  image: DecorationImage(
                                                    image: AssetImage("${imgs[i]}"),
                                                    fit: BoxFit.cover,     
                                                    ),
                                                  ),
                                              ),
                                              Container(
                                                //details of a item
                                                margin: const EdgeInsets.only(top: 20),
                                                width: 100,
                                                height: 100,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: const Text("Cement",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        fontFamily: "poppins",
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        height: 1.15),),
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      margin: const EdgeInsets.all(7),
                                                      padding: const EdgeInsets.only(left:2.0,right: 2),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            child: const Icon(Icons.location_on,size: 12.0,color: Colors.black,)),
                                                          Container(
                                                            width:60,
                                                            padding: const EdgeInsets.only(left:3.0,right: 2),
                                                            child: const Text(
                                                              "Perera Hardware, Maharagama",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 8),
                                                                maxLines:3,
                                                                overflow: TextOverflow.ellipsis
                                                                ,softWrap: false,
                                                                ))
                                                        ],
                                                      ),
                                                    )
                                        
                                                    
                                                  ],
                                                  
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                    
                        }),
                  ),
                  
            ],
          ),
        ),
      ),
    );
  }
}
