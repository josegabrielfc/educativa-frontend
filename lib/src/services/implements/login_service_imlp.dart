import 'dart:convert';
import 'package:educativa_frontend/src/models/login/login_model.dart';
import 'package:educativa_frontend/src/services/mixins/login_service.dart';
import 'package:http/http.dart' as http;

import '../../config/environment/environment.dart';

class LoginServiceImlp with LoginService {
  @override
  Future<Map<String, dynamic>> login(LoginModel loginRequest) async {
    final String url = '$urlBase/usuario/login';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(loginRequest),
    );

    final responseBody = json.decode(response.body);

    return responseBody;
  }
}
