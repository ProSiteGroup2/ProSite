import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../globals.dart';

class GetUsersData {

  Future<Map<String, dynamic>?> getUserInfo(String url) async {
      try {
        var client = http.Client();
        final response = await client.get(Uri.parse(url), headers:{
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader:'Bearer $token',
        });
            if(jsonDecode(response.body)['success']){
              return jsonDecode(response.body)['consumer'];
              }else{
              throw jsonDecode(response.body)['error'];
              }
      }
      catch(err){
          print(err.toString());
          throw err.toString();
      }
  }

}