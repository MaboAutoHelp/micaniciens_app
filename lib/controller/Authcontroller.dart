import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class Authcontroller {
  Future LoginAuth(email, pwd) async {
    var url = "http://192.168.1.17:8000/Micaniciens/login";
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(<String, String>{'email': email, 'pwd': pwd}),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }
 
}