import 'package:flutter/material.dart';
import 'package:group2/common/size.dart';

//import '../common/color.dart';


class ImageCauserol_b extends StatefulWidget {
  BuildContext context;
  List<dynamic> tags;

  ImageCauserol_b({Key? key, required this.context, required this.tags})
      : super(key: key);

  @override
  State<ImageCauserol_b> createState() =>
      _ImageCauserol_bState(context: context, tags: tags);
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
       width: kPropWidth(context, 1),
       height:kPropHeight(context, 0.3) ,
      child: ListView.builder(
        
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (context, i) {
            return Container(
                          
                          margin: EdgeInsets.all(20),
                         
                          
                          // margin: EdgeInsets.only( right:20,top: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                          child: Row(
                            children: [
                              Container(
                                width: 110,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage("${tags[i].image}"),
                                    fit: BoxFit.cover,     
                                    ),
                                  ),
                              ),
                              Container(
                                 margin: EdgeInsets.only(top: 20),
                                 width: 100,
                                height: 100,
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text("Cement",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontFamily: "poppins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        height: 1.15),),
                                    ),
                                    Container(
                                      width: 100,
                                      margin: EdgeInsets.all(7),
                                      padding: EdgeInsets.only(left:2.0,right: 2),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20,
                                            child: Icon(Icons.location_on,size: 12.0,)),
                                          Container(
                                            width:60,
                                            padding: EdgeInsets.only(left:3.0,right: 2),
                                            child: Text(
                                              "Perera Hardware, Maharagama",
                                               style: TextStyle(
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
                        );

          }),
    );
  }
}
