// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:group2/common/size.dart';
import 'package:group2/src/ui/item_details.dart';

import '../globals.dart';

//import '../common/color.dart';


class ImageCauserol_b extends StatefulWidget {

  List<dynamic> tags;

  ImageCauserol_b({Key? key, required this.tags})
      : super(key: key);

  @override
  State<ImageCauserol_b> createState() =>
      _ImageCauserol_bState(tags:tags);
}

class _ImageCauserol_bState extends State<ImageCauserol_b> {
  int photo = 1;

  List<dynamic> tags;

  _ImageCauserol_bState({required this.tags});

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
    );
  }
}
