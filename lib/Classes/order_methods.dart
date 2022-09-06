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

  getHardwareOrders(SellerID) async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getHardwareOrders/$SellerID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Getting Hardware Orders Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getConsumerOrders(ConsumerID) async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getConsumerOrders/$ConsumerID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Getting Consumer Orders Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getTransporterOrders(TransporterID) async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getTransporterOrders/$TransporterID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Getting Transporter Orders Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getContractorOrders(ContractorID) async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getContractorOrders/$ContractorID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Getting Contractor Orders Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getLabourOrders(LabourID) async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getLabourOrders/$LabourID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Getting Labour Orders Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}