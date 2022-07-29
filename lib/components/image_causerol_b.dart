// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:group2/common/size.dart';
import 'package:group2/src/ui/item_details.dart';

//import '../common/color.dart';


class ImageCauserol_b extends StatefulWidget {
  BuildContext context;
  List<dynamic> tags;

  ImageCauserol_b({Key? key, required this.context, required this.tags})
      : super(key: key);

  @override
  State<ImageCauserol_b> createState() =>
      _ImageCauserol_bState(context: context, tags:tags);
}

class _ImageCauserol_bState extends State<ImageCauserol_b> {
  int photo = 1;

  BuildContext context;
  List<dynamic> tags;

  _ImageCauserol_bState({required this.context, required this.tags});

  final ScrollController _scrollController = ScrollController();

 


  @override
  Widget build(BuildContext context) {
    return Container(
      width: kPropWidth(context, 0.9),
      height:kPropHeight(context, 0.55) ,
      child: ListView.builder(
        
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          itemCount: tags.length,
          itemBuilder: (context, i) {
            return Container(
                          
                          margin: EdgeInsets.all(20),
                          width: 220,
                          height: 100,
                          
                          // margin: EdgeInsets.only( right:20,top: 15),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            //  border: Border.all(width: 2, color: Colors.grey.shade200),
                             borderRadius: BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.25),
                                  spreadRadius: 10,
                                  blurRadius: 7,
                                  offset: Offset(2, 5), // changes position of shadow
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.8),
                                  spreadRadius: 10,
                                  blurRadius: 7,
                                  offset: Offset(-10, -10), // changes position of shadow
                                ),
                              ],
                          ),
                          
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              
                              ElevatedButton(
                                onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>ItemDetails()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    
                                     primary: Colors.white,
                                     shadowColor: Colors.grey.withOpacity(0.25),
                                     padding: EdgeInsets.symmetric(
                                       vertical: 0.0, horizontal: 0.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(20.0),
                                      ),
                                    ), 
                                child: Row(
                                  children: [
                                      Container(
                                        child: Container(
                                          width: 140,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Colors.grey.shade200),
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.white,
                                        
                                        image: DecorationImage(
                                          
                                          image: AssetImage("${tags[i]['image']}"),
                                          fit: BoxFit.cover,     
                                          ),
                                        ),
                                        
                                    ),
                                  ),
                                  
                                 ],
                                                          ),
                              ),
                            
                              Positioned(
                                bottom: 15,
                                right: 18,
                                
                                child: Container(
                                  height: 50,
                                  width: 180,
                                  alignment: Alignment.centerRight,
                                    decoration: BoxDecoration(
                                          color: Colors.white70,
                                           border: Border.all(width: 2, color: Colors.grey.shade200),
                                           borderRadius: BorderRadius.all(Radius.circular(15)),
                                           boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.25),
                                                spreadRadius: 1,
                                                blurRadius: 4,
                                                offset: Offset(5, 5), // changes position of shadow
                                              ),]
                                            
                                            
                                    ),
                                    child: Column( 
                                      children: [
                                           Container(
                                             margin: EdgeInsets.all(5),
                                             alignment: Alignment.center,
                                             child: Text(
                                              "${tags[i]['brand']}",
                                                          style: TextStyle(
                                                                color: Colors.black,
                                                                fontFamily: "poppins",
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.bold,
                                                                height: 1.15),
                                                                ),
                                                      ),
                                            Container(
                                              width: kPropWidth(context, 1),
                                              padding: EdgeInsets.only(left:2.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 10,
                                                    child: Icon(Icons.location_on,size: 12.0,)),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 2),  
                                                    alignment: Alignment.center,                                                 
                                                    child: Text(
                                                      "${tags[i]['hardware']}",
                                                       style: TextStyle(
                                                         fontSize: 9),
                                                         maxLines:3,
                                                         overflow: TextOverflow.ellipsis
                                                         ,softWrap: false,
                                                         ))
                                                ],
                                              ),
                                            )
                                        ],
                                    ),
                                ),
                              ),

                              ],
                            
                            ),
                        );

          }),
    );
  }
}
