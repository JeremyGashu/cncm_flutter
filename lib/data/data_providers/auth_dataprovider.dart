import 'dart:convert';

import 'package:cncm_flutter_new/core/urls.dart';
import 'package:http/http.dart' as http;

class AuthDataProvider {
  Future<http.Response> sendLoginData(
      {required String username, required String password}) async {
    http.Response response = await http.post(Uri.parse('$baseUrl/auth/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'username': username, 'password': password}));
    return response;
  }
}
