import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class Authcontroller {
  Future LoginAuth(email, pwd) async {
    var url = "http://192.168.1.19:8000/Ziza/login";
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(<String, String>{'name': email, 'pwd': pwd}),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }
 
}