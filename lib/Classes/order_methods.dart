import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderMethods{
  Dio dio=new Dio();

  addOrder(BuyerID,productID,quantity,amount,seller) async {
    try {
      return await dio.post('https://prositegroup2.herokuapp.com/addOrder/$BuyerID',
      data: {
        "item":productID,
        "quantity":quantity,
        "amount":amount,
        "seller":seller
      },
      options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Adding Product Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}