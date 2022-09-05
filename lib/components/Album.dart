import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://prositegroup2.herokuapp.com/getOrders'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  
  final String id;

  const Album({
    
    required this.id,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      
      id: json['title'],
    );
  }
}