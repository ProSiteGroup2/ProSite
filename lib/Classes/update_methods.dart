import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:group2/globals.dart';

class UpdateServices {


      Future<void> upadateData(String url, Map<String,dynamic> data) async {
        try{
          var client = http.Client();
          final response =await client.put(Uri.parse(url),headers: {
              'Content-Type': 'application/json',
              HttpHeaders.authorizationHeader:'Bearer $token',
            },
            body:jsonEncode(data));
          if(jsonDecode(response.body)['successes']){
            return;
          }else{
            throw jsonDecode(response.body)['error'];
          }
        }catch(err){
            print(err.toString());
        }
      }




}