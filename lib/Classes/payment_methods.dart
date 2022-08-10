
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentMethods {
  Dio dio = new Dio();

  addCard(cardNumber,expiryDate,cvvCode,cardHolderName) async {

    try{
      return await dio.post('https://prositegroup2.herokuapp.com/addCard',
      data:{
        "cardNumber":cardNumber,
        "expiryDate":expiryDate,
        "cvvCode":cvvCode,
        "cardHolderName":cardHolderName, 
      },options: Options(contentType: Headers.jsonContentType));
      
    }
    on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

  }


}
