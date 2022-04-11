import 'dart:convert';

import 'package:cncm_flutter_new/data/data_providers/auth_dataprovider.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final AuthDataProvider dataProvider;

  AuthRepository(this.dataProvider);

  Future sendLoginData(
      {required String username, required String password}) async {
    http.Response response = await dataProvider.sendLoginData(
        username: username, password: password);

    if (response.statusCode == 200) {
      return {'success': true, 'authData': jsonDecode(response.body)};
    }
    return {'success': false, 'response': jsonDecode(response.body)};
  }
}
