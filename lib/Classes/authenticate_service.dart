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

  SPLogin(email, password) async {
    try{
      return await dio.post('https://prositegroup2.herokuapp.com/SPLogin',
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

  addConsumer(username,email,contactNo,address,hometown,district,password) async {
    try{
      return await dio.post('https://prositegroup2.herokuapp.com/addConsumer',
      data:{
        "username":username,
        "email":email,
        "contactNo":contactNo,
        "address":address,
        "hometown":hometown,
        "district":district,
        "password":password
      },
      options: Options(contentType:Headers.jsonContentType));
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

  addContractor(contractorname,email,contactNo,address,hometown,district,regno,no_of_workers,password) async {
    try{
      return await dio.post('https://prositegroup2.herokuapp.com/addContractor',
          data:{
            "contractorname":contractorname,
            "email":email,
            "contactNo":contactNo,
            "address":address,
            "hometown":hometown,
            "district":district,
            "regno":regno,
            "no_of_workers":no_of_workers,
            "password":password
          },
          options: Options(contentType:Headers.jsonContentType));
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

  addLabour(profession,username,email,contactNo,address,hometown,district,qualification,experience,password) async {
    try{
      return await dio.post('https://prositegroup2.herokuapp.com/addLabour',
          data:{
            "profession":profession,
            "username":username,
            "email":email,
            "contactNo":contactNo,
            "address":address,
            "hometown":hometown,
            "district":district,
            "qualification":qualification,
            "experience":experience,
            "password":password
          },
          options: Options(contentType:Headers.jsonContentType));
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

  addHardware(hardwarename,email,contactNo,address,city,district,regno,owner,password) async {
    try{
      return await dio.post('https://prositegroup2.herokuapp.com/addHardware',
          data:{
            "hardwarename":hardwarename,
            "email":email,
            "contactNo":contactNo,
            "address":address,
            "city":city,
            "district":district,
            "regno":regno,
            "owner":owner,
            "password":password
          },
          options: Options(contentType:Headers.jsonContentType));
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

  addTransporter(username,email,contactNo,address,hometown,district,vehicle,work_out,password) async {
    try{
      return await dio.post('https://prositegroup2.herokuapp.com/addTransporter',
          data:{
            "username":username,
            "email":email,
            "contactNo":contactNo,
            "address":address,
            "hometown":hometown,
            "district":district,
            "vehicle":vehicle,
            "work_out":work_out,
            "password":password
          },
          options: Options(contentType:Headers.jsonContentType));
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