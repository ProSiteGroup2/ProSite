import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductMethods{
  Dio dio=new Dio();

  addProduct(productname,price,stock,size,category,description,brand,seller) async {
    try {
      return await dio.post('https://prositegroup2.herokuapp.com/addProduct',
      data:{
        "productname":productname,
        "price":price,
        "stock":stock,
        "size":size,
        "category":category,
        "description":description,
        "brand":brand,
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

  getCementProduct() async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getCementProduct');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'getting cement products failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getBricksProduct() async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getBricksProduct');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'getting bricks products failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getSteelProduct() async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getSteelProduct');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'getting steel products failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getSandProduct() async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getSandProduct');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'getting sand products failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getHardwareProduct(seller_id) async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getHardwareProduct/$seller_id');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'getting hardware products failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}