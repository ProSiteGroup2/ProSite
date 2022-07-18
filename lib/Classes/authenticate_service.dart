import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class AuthService{
  Dio dio=new Dio();

  consumerLogin(email, password) async {
    try{
      return await dio.post('https://prositegroup2.herokuapp.com/consumerLogin',
      data: {"email":email,"password":password},
      options: Options(contentType: Headers.jsonContentType));
    } on DioError catch(e){
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