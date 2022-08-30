// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/cart_methods.dart';
import 'package:group2/common/size.dart';

import '../globals.dart';



class addcart extends StatefulWidget {
  const addcart({Key? key}) : super(key: key);

  @override
  State<addcart> createState() => _addcartState();
}

class _addcartState extends State<addcart> {

  List tags=[];
  String local_cartID='';
  final ScrollController _scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    gettingCartItems();
  }

  String alert_text='';
 int total_price=0;

  gettingCartItems() async {
    try {
      var buyerID;
      if(consumer.isNotEmpty){
        buyerID=consumer['_id'];
      }else{
        buyerID=sp['_id'];
      }
      var result=await CartMethods().getCartItem(buyerID);
      if(result.data['success']){
        setState(() {
          local_cartID=result.data['cartitem']['_id'];
          tags=result.data['cartitem']['cartProducts'];
        });
        if(tags.isEmpty){
          alert_text='There are no cart items';
        }
        if(tags.isNotEmpty){
          for(var i=0;i<tags.length;i++){
            total_price=total_price +(tags[i]['quantity']*tags[i]['product']['price']) as int;
          }
        }
        print(tags);
      }else{
        Fluttertoast.showToast(
            msg:result.data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(
          msg:'An Error occured',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  TextEditingController quantityText=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Cart',
        style: TextStyle(fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins'),),
        centerTitle: true,
        backgroundColor: Color(0xFFB1E1FF),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(

                margin: EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                width: kPropWidth(context, 1) ,
                height:550,
                child: alert_text!=''?Center(child:Text('Cart is Empty',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)): tags.isEmpty?Center(child: CircularProgressIndicator()): ListView.builder(

                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemCount: tags.length,
                    itemBuilder: (context, i) {
                      return Container(

                        margin: const EdgeInsets.all(10),
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

                          onPressed: () {},
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
                                child: Container(
                                  //image
                                  alignment: Alignment.centerLeft,
                                  width: 100,
                                  height: 95,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage("${tags[i]['product']['imageUrl']}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5,),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5.0,),
                                    Text(tags[i]['product']['productname'],
                                      style: TextStyle(
                                          fontFamily: "poppins",
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          height: 1.15),),
                                    SizedBox(height: 3.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Rs. ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 17.0
                                          ),),
                                        Text('${tags[i]['quantity']* tags[i]['product']['price']}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF2A93D5),
                                              fontSize: 17.0
                                          ),),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Quantity : ",style: TextStyle(color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),),

                                        IconButton(
                                          onPressed: () async {
                                            setState(() {
                                              if (tags[i]['product']['stock']>tags[i]['quantity']) {
                                                tags[i]['quantity']++;
                                              }
                                              total_price=0;
                                              for(var i=0;i<tags.length;i++){
                                                total_price=total_price +(tags[i]['quantity']*tags[i]['product']['price']) as int;
                                              }
                                            });

                                            await CartMethods().updateCartProduct(tags[i]['_id'], tags[i]['quantity'], tags[i]['quantity']*tags[i]['product']['price']);
                                            await CartMethods().updateCartPrice(local_cartID, total_price);
                                          },
                                          splashColor: Colors.lightBlueAccent,
                                          splashRadius: 20.0,
                                          icon: Icon(Icons.add),
                                          color: Colors.black,
                                        ),
                                        Text(
                                          '${tags[i]['quantity']}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            setState(() {
                                              if (tags[i]['quantity']>1) {
                                                tags[i]['quantity']--;
                                              }
                                              total_price=0;
                                              for(var i=0;i<tags.length;i++){
                                                total_price=total_price +(tags[i]['quantity']*tags[i]['product']['price']) as int;
                                              }
                                            });
                                            await CartMethods().updateCartProduct(tags[i]['_id'], tags[i]['quantity'], tags[i]['quantity']*tags[i]['product']['price']);
                                            await CartMethods().updateCartPrice(local_cartID, total_price);
                                          },
                                          splashColor: Colors.lightBlueAccent,
                                          splashRadius: 20.0,
                                          icon: Icon(Icons.remove),
                                          color: Colors.black,
                                        ),
                                     ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () async {
                                      var result=await CartMethods().removeCPfromCart(local_cartID, tags[i]['_id']);
                                      if(result.data['success']){
                                        Fluttertoast.showToast(
                                            msg: result.data['msg'],
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                      setState(() {
                                        tags.removeAt(i);
                                        total_price=0;
                                        for(var i=0;i<tags.length;i++){
                                          total_price=total_price +(tags[i]['quantity']*tags[i]['product']['price']) as int;
                                        }
                                      });

                                      await CartMethods().updateCartPrice(local_cartID, total_price);
                                    },
                                    icon: Icon(Icons.delete),
                                color: Colors.red,),
                              ),
                            ],
                          ),
                        ),
                      );

                    }),
              ),
              SizedBox(height:15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Price:  Rs. ',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold

                  ),),
                  Text('$total_price',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent
                    ),),
                ],
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () async {
                    await CartMethods().updateCartPrice(local_cartID, total_price);
                  },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF9C9EFE),
                ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Checkout',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
              )
            ],
        ),
      ),
    ));
    
  }
}