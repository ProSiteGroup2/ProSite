// ignore_for_file: unnecessary_new, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SPMethods{
  
  Dio dio=new Dio();

  addFeedback(consumerID,sp_email,feedback) async {
    try{

      return await dio.post('https://prositegroup2.herokuapp.com/addFeedback',
      data: {
         "consumer":consumerID,
        "sp_email":sp_email,        
        "feedback": feedback
        },
      options: Options(contentType: Headers.jsonContentType)
      );

    }on DioError catch(e){
      Fluttertoast.showToast( msg: e.response?.data['msg'],
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
     
      
    }
  }

  addAppointment(consumerID,sp_email,app_date,app_time) async {
    try {
      return await dio.post('https://prositegroup2.herokuapp.com/addAppointment',
      data: {
        "consumer":consumerID,
        "sp_email":sp_email,
        "date":app_date,
        "time":app_time
      },
      options: Options(contentType: Headers.jsonContentType));
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

  getFeedback(sp_email) async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getFeedback/$sp_email');
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

  getConsumerPastAppointment(consumerID) async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getConsumerPastAppointments/$consumerID');
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

  getSPPastAppointment(sp_email) async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getSPPastAppointments/$sp_email');
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

  getConsumerUpcomingAppointment(consumerID) async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getConsumerUpcomingAppointments/$consumerID');
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

  getSPUpcomingAppointment(sp_email) async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getSPUpcomingAppointments/$sp_email');
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

  getContractors() async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getContractors');
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

  getTransporters() async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getTransporters');
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

  getLabours() async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getLabours');
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

  getMason() async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getMason');
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

  getElectrician() async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getElectrician');
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

  getPlumber() async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getPlumber');
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

  getArchitecturer() async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getArchitecturer');
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

  getCarpenter() async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getCarpenter');
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

  getPainter() async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/getPainter');
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

  findSP(sp_email) async {
    try {
      return await dio.get('https://prositegroup2.herokuapp.com/findSP/$sp_email');
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
