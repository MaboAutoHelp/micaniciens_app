import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Notificationscontroller {
  

  static Future<void> updateServiceIta(String id, String id1 ) async {
    var url = "http://192.168.1.27:8000/Revenus/Revenus";
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"id":id,"id1":id1}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update service');
    }
  }
}