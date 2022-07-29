import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductMethods{
  Dio dio=new Dio();

  addProduct(productname,price,stock,size,category,description,seller) async {
    try {
      return await dio.post('https://prositegroup2.herokuapp.com/addProduct',
      data:{
        "productname":productname,
        "price":price,
        "stock":stock,
        "size":size,
        "category":category,
        "description":description,
        "seller":seller
      },options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getProductInfo(productID) async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getProductInfo/$productID');
    } on DioError catch (e) {
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