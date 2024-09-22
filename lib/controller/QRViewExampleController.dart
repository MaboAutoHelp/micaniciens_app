import 'dart:convert';
//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExampleController {
  Future<Map<String, dynamic>> getServiceDetails(String serviceID) async {
    var url = "http://192.168.1.18:8000/admin/getAdmin/$serviceID";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load service details');
    }
  }
}
