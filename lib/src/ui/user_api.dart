import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  final String productname;
  final String imageUrl;
  final int price;

  const User({required this.productname, required this.imageUrl, required this.price});

  static User fromJson(Map<String, dynamic> json) => User(
        productname: json['productname'],
        imageUrl: json['imageUrl'],
        price: json['price'],
      );
}

class UserApi {
  static Future<List<User>> getProductSuggestions(String query) async {
    final url = Uri.parse('https://prositegroup2.herokuapp.com/getProducts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List users = json.decode(response.body)['products'];

      return users.map((json) => User.fromJson(json)).where((user) {
        final nameLower = user.productname.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
