import 'dart:convert';

import 'package:group2/src/ui/Usermodel.dart';
import 'package:http/http.dart' as http;

class User {
  // Id id;
  String productname;
  String imageUrl;
  int price;
  String category;
  String size;
  int stock;
  String brand;
  String description;
  // Id? seller;

  User({
    // required this.id,
    required this.productname,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.size,
    required this.stock,
    required this.brand,
    required this.description,
    // required this.seller,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        // id: json['_id'],
        productname: json['productname'],
        imageUrl: json['imageUrl'],
        price: json['price'],
        category: json['category'],
        size: json['size'],
        stock: json['stock'],
        brand: json['brand'],
        description: json['description'],
        // seller: json['seller'] != null ? Id.fromJson(json['seller']) : null,
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
