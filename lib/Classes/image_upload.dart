
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImgUpload{
  Dio dio=new Dio();

  productImage(File file,productID) async {
    try {
      String fileName=file.path.split('/').last;
      FormData formData=FormData.fromMap({
        "image": await MultipartFile.fromFile(file.path, filename:fileName),
      });

      return await dio.put('https://prositegroup2.herokuapp.com/productImage/$productID', data: formData);
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'image upload failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  consumerProfile(File file,email) async {
    try {
      String fileName=file.path.split('/').last;
      FormData formData=FormData.fromMap({
        "profile": await MultipartFile.fromFile(file.path, filename:fileName),
      });

      return await dio.put('https://prositegroup2.herokuapp.com/consumerProfile/$email', data: formData);
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'image upload failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  hardwareProfile(File file,email) async {
    try {
      String fileName=file.path.split('/').last;
      FormData formData=FormData.fromMap({
        "profile": await MultipartFile.fromFile(file.path, filename:fileName),
      });

      return await dio.put('https://prositegroup2.herokuapp.com/hardwareProfile/$email', data: formData);
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'image upload failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  contractorProfile(File file,email) async {
    try {
      String fileName=file.path.split('/').last;
      FormData formData=FormData.fromMap({
        "profile": await MultipartFile.fromFile(file.path, filename:fileName),
      });

      return await dio.put('https://prositegroup2.herokuapp.com/contractorProfile/$email', data: formData);
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'image upload failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  labourProfile(File file,email) async {
    try {
      String fileName=file.path.split('/').last;
      FormData formData=FormData.fromMap({
        "profile": await MultipartFile.fromFile(file.path, filename:fileName),
      });

      return await dio.put('https://prositegroup2.herokuapp.com/labourProfile/$email', data: formData);
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'image upload failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  transporterProfile(File file,email) async {
    try {
      String fileName=file.path.split('/').last;
      FormData formData=FormData.fromMap({
        "profile": await MultipartFile.fromFile(file.path, filename:fileName),
      });

      return await dio.put('https://prositegroup2.herokuapp.com/transporterProfile/$email', data: formData);
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'image upload failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}