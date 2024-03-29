// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:group2/common/size.dart';
import 'package:group2/pages/customer_contractorview.dart';
import 'package:group2/src/ui/item_details.dart';

import '../globals.dart';
//import '../common/color.dart';

// ignore: must_be_immutable
class ImageCauserol_cont_id extends StatefulWidget {

  List<dynamic> tags;

  ImageCauserol_cont_id({Key? key, required this.tags})
      : super(key: key);

  @override
  State<ImageCauserol_cont_id> createState() =>
      // ignore: no_logic_in_create_state
  _ImageCauserol_cont_idState(tags: tags);
}

class _ImageCauserol_cont_idState extends State<ImageCauserol_cont_id> {
  int photo = 1;


  List<dynamic> tags;

  _ImageCauserol_cont_idState({required this.tags});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kPropWidth(context, 1),
      height: kPropHeight(context, 1),
      child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          itemCount: tags.length,
          itemBuilder: (context, i) {
            return Container(

              margin: const EdgeInsets.all(20),
              // width: krp,
              // height: 100,

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
                  sp=tags[i];
                 
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
                      flex:2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(tags[i]['_id'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,),),
                          ),
                          SizedBox(height: 3.0,),
                        
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            );
          }),
    );
  }
}
