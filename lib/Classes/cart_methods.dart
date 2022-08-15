import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class CartMethods{
  Dio dio=new Dio();

  addCartProduct(buyerID,productID,quantity,price) async {
    try {
      return await dio.post('https://prositegroup2.herokuapp.com/addCartProduct/$buyerID',
      data: {
        "product":productID,
        "quantity":quantity,
        "price":price
      },
      options: Options(contentType:Headers.jsonContentType));
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

  addCart(buyerID) async {
    try {
      return await dio.post('https://prositegroup2.herokuapp.com/addCart/$buyerID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: "Creating Cart Item Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  addProducttoCart(buyerID,cartProductID) async {
    try {
      return await dio.put('https://prositegroup2.herokuapp.com/addCartItem/$buyerID',
      data: {
        "cartProduct":cartProductID
      },
      options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: "Adding Product to Cart Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getCartItem(buyerID) async {
    try {
      return await dio.put('https://prositegroup2.herokuapp.com/getCartItem/$buyerID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: "Getting Cart Item Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  deleteCartProducts(buyerID) async {
    try {
      return await dio.delete('https://prositegroup2.herokuapp.com/deleteCartProduct/$buyerID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: "Deleting Cart Products Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  deleteProductsinCart(buyerID) async {
    try {
      return await dio.put('https://prositegroup2.herokuapp.com/deleteProductsinCart/$buyerID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: "Deleting Products in Cart Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}