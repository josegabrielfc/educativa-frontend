import 'dart:convert';
import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/global_models.dart';

import 'package:http/http.dart' as http;
import 'package:educativa_frontend/src/models/usuario/usuario_model.dart';
import 'package:educativa_frontend/src/services/mixins/usuario_service.dart';

class UsuarioServiceImlp with UsuarioService {
  @override
  Future<Response> registrar(UsuarioRegistro usuarioRegistro) async {
    final String url = '$urlBase/usuario/registro';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(usuarioRegistro),
    );

    final responseBody = json.decode(response.body);
    return Response.fromJson(responseBody);
  }
  
}
