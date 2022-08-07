// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:group2/common/size.dart';

class card_details extends StatefulWidget {
  card_details({Key? key}) : super(key: key);

  @override
  State<card_details> createState() => _card_detailsState();
}

class _card_detailsState extends State<card_details> {

   final _formKey = GlobalKey<FormState>();

  String _cardnumber = '';
  String _exdate = '';
  String _cvv = '';
  

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_cardnumber);
      debugPrint(_exdate);
      debugPrint(_cvv);
    }
  }

  @override
  final cons_cardnumberController = TextEditingController();
  final cons_exdateController = TextEditingController();
  final cons_cvvController = TextEditingController();
  late bool _cvvVisible;
  void initState() {
    _cvvVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Color(0xE5E5E5),
        elevation: 0,
        toolbarHeight: 50,
        bottom: PreferredSize(
          preferredSize:Size.fromHeight(kPropHeight(context, 0.05)),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.bottomCenter,
                child: Text("Add payment information",
                style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  height: 1.15
                ),
                
                ),
              ),
            ],
          ),
        ),
         
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                    Container(
                      //hr line
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(color: Colors.blueAccent),
                                      ),
                                    ),
                    ),
                       Container(
                            //contact number title
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.fromLTRB(20,12,20,15),
                            child: Text("Card Number",style: TextStyle(
                              fontFamily: "Roboto",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 1.15
                            ),), 
                          ),
                          Container(
                            //contact number text
                            margin: EdgeInsets.fromLTRB(0,10,0,0),
                            padding: const EdgeInsets.only(right: 25,left:25),
                              child: TextFormField(
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(12),
                                          fillColor: Colors.white,
                                          filled: true,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          hintText: 'card number',
                                          hintStyle: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                          
                                          border: OutlineInputBorder(
                                            // borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          labelText: 'Card Number',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.trim().isEmpty) {
                                            return 'Please enter your card number';
                                          }

                                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                            return 'Please enter a valid card number';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) => _cardnumber = value,
                                      ),
                                    
                          ),
                          Container(
                            child: Row(
                              children: [
                                 Container(
                                   child: Column(
                                     children: [
                                       Container(
                                        //expiry date
                                        alignment: Alignment.bottomLeft,
                                        margin: EdgeInsets.fromLTRB(20,12,20,15),
                                        child: Text("Expiry Date",style: TextStyle(
                                          fontFamily: "Roboto",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            height: 1.15
                                        ),), 
                                         ),
                                         Container(
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
                                     ],
                                   ),
                                 ),
                                
                              ],
                            ),
                          )
            
            ],
          ),
        )),
      
    );
  }
}