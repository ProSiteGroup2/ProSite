import 'dart:convert';

import 'package:group2/src/ui/Usermodel.dart';
import 'package:http/http.dart' as http;


class FetchUserList {
  var data = [];
  List<Productlist> results = [];
  String urlList = 'https://prositegroup2.herokuapp.com/getProducts';

  Future<List<Productlist>> getProductList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
      
        data = json.decode(response.body);
        results = data.map((e) => Productlist.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.productname!.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}
