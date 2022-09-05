import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationMethods{
  Dio dio=new Dio();

  purchaseNotify(BuyerID,message,sellerID,productID) async {
    try {
      return await dio.post('https://prositegroup2.herokuapp.com/purchaseNotify/$BuyerID',
      data: {
        "message":message,
        "seller":sellerID,
        "product":productID
      },
      options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Purchase Notifying Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  hireNotify(WorkerID,message,consumerID) async {
    try {
      return await dio.post('https://prositegroup2.herokuapp.com/hireNotify/$WorkerID',
      data: {
        "message":message,
        "consumer":consumerID
      },
      options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Hire Notifying Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  pushNotifytoBuyer(BuyerID, NotificationID) async {
    try {
      return await dio.put('https://prositegroup2.herokuapp.com/pushNotifytoBuyer/$BuyerID',
      data: {
        "notification": NotificationID
      });
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Push Notification to Buyer Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  pushNotifytoSeller(SellerID,NotificationID) async {
    try {
      return await dio.put('https://prositegroup2.herokuapp.com/pushNotifytoSeller/$SellerID',
      data: {
        "notification": NotificationID
      },
      options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Push Notification to Seller Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  
  pushNotifytoWorker(WorkerID,NotificationID) async{
    try {
      return await dio.put('https://prositegroup2.herokuapp.com/pushNotifytoWorker/$WorkerID',
          data: {
            "notification": NotificationID
          },
          options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Push Notification to Worker Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  pushNotifytoConsumer(ConsumerID,NotificationID) async {
    try {
      return await dio.put('https://prositegroup2.herokuapp.com/pushNotifytoConsumer/$ConsumerID',
      data: {
        "notification": NotificationID
      },
      options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Push Notification to Consumer Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getConsumerNotify(ConsumerID) async{
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getConsumerNotify/$ConsumerID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Getting Consumer notification Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getHardwareNotify(HardwareID) async{
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getHardwareNotify/$HardwareID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Getting Hardware notification Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getLabourNotify(LabourID) async{
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getLabourNotify/$LabourID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Getting Labour notification Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getTransporterNotify(TransporterID) async{
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getTransporterNotify/$TransporterID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Getting Transporter notification Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getContractorNotify(ContractorID) async{
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getContractorNotify/$ContractorID');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Getting Contractor notification Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}