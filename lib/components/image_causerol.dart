// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:group2/common/size.dart';
import 'package:group2/src/ui/item_details.dart';
//import '../common/color.dart';

// ignore: must_be_immutable
class ImageCauserol extends StatefulWidget {

  List<dynamic> tags;

  ImageCauserol({Key? key, required this.tags})
      : super(key: key);

  @override
  State<ImageCauserol> createState() =>
      // ignore: no_logic_in_create_state
      _ImageCauserolState(tags: tags);
}

class _ImageCauserolState extends State<ImageCauserol> {
  int photo = 1;


  List<dynamic> tags;

  _ImageCauserolState({required this.tags});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kPropWidth(context, 1),
      height: 140,
      child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
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

                    offset:
                        const Offset(-10, -10), // changes position of shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ItemDetails()),
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
                        border:
                            Border.all(width: 1, color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("${tags[i]['image']}"),
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
                            child: Text(
                              "${tags[i]['name']}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 1.15),
                            ),
                          ),
                          Container(
                            width: 100,
                            margin: const EdgeInsets.all(7),
                            padding: const EdgeInsets.only(left: 2.0, right: 2),
                            child: Row(
                              children: [
                                Container(
                                    width: 20,
                                    child: const Icon(
                                      Icons.location_on,
                                      size: 12.0,
                                      color: Colors.black,
                                    )),
                                Container(
                                    width: 60,
                                    padding: const EdgeInsets.only(
                                        left: 3.0, right: 2),
                                    child: Text(
                                      "${tags[i]['hardware']}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 8),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
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
    );
  }
}
