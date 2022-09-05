// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:group2/common/size.dart';
import 'package:group2/src/ui/item_details.dart';
import 'package:group2/globals.dart';
//import '../common/color.dart';


// ignore: must_be_immutable
class cement extends StatefulWidget {
  BuildContext context;
  List<dynamic> tags;

  cement({Key? key, required this.context, required this.tags})
      : super(key: key);

  @override
  State<cement> createState() =>
      // ignore: no_logic_in_create_state
      _cementState(context: context, tags: tags);
}

class _cementState extends State<cement> {
  int photo = 1;

  @override
  BuildContext context;
  List<dynamic> tags;

  _cementState({required this.context, required this.tags});

  final ScrollController _scrollController = ScrollController();

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Cement",style: TextStyle(fontFamily: "Poppins",color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold) ),
        leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ), 
        backgroundColor: Colors.brown[200],
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
                    image: AssetImage("assets/imgs/cement.jpg"),
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
                        itemCount: tags.length,
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
                                              product=tags[i];
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) =>ItemDetails()),
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
                                              Expanded(
                                                flex:1,
                                                child: Container(
                                                  //image
                                                  alignment: Alignment.centerLeft,
                                                  width: 110,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(width: 1, color: Colors.grey.shade200),
                                                    borderRadius: BorderRadius.circular(20),
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                      image: NetworkImage("${tags[i]['imageUrl']}"),
                                                      fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                ),
                                              ),
                                              Expanded(
                                                flex:2,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: Text(tags[i]['productname'],
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            fontFamily: "poppins",
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                            height: 1.15),),
                                                    ),
                                                    SizedBox(height: 3.0,),
                                                    Text('Rs. ${tags[i]['price']}',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.red,
                                                          fontSize: 17.0
                                                      ),),
                                                    SizedBox(height: 3.0,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(Icons.location_on,size: 14.0,color: Colors.black,),
                                                        Text(
                                                          "${tags[i]['seller']['hardwarename']}, ${tags[i]['seller']['city']}",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 12),
                                                          maxLines:3,
                                                          softWrap: false,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),

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
