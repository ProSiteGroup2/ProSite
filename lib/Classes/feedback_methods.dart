import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class FeedbackMethods{

  Dio dio=new Dio();

  addFeedback(feedback) async {
    
    try{
      return await dio.post('https://prositegroup2.herokuapp.com/addFeedback',
       data: {
        "feedback": feedback,
        
       },options: Options(contentType: Headers.jsonContentType)
      
      );

    }on DioError catch(e){

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