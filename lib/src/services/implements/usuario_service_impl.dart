import 'dart:convert';
import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/global_models.dart';

import 'package:http/http.dart' as http;
import 'package:educativa_frontend/src/models/usuario/usuario_model.dart';
import 'package:educativa_frontend/src/services/mixins/usuario_service.dart';

class UsuarioServiceImlp with UsuarioService {
  @override
  Future<UsuarioModel> detalleUsuario(String correo, String token) async {
    final String url = '$urlBase/usuario/detalle?correo=$correo';

    final Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    final responseBody = json.decode(response.body);
    final UsuarioModel usuarioModel =
        UsuarioModel.fromJson(responseBody["msg"]);

    return usuarioModel;
  }

  @override
  Future<Response> registrarEstudiante(
      UsuarioRegistro usuarioRegistro, String token) async {
    final String url = '$urlBase/usuario/guardarEstudiante';

    final Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };

    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(usuarioRegistro));

    final responseBody = json.decode(response.body);
    final Response respuesta = Response.fromJson(responseBody);

    return respuesta;
  }

  @override
  Future<Response> cambiarContrasena(
      int id, String contrasena, String token) async {
    final String url = '$urlBase/usuario/cambiar';

    final Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };

    final Map<String, dynamic> bodyData = {'id': id, 'contrasena': contrasena};
    final response = await http.put(Uri.parse(url),
        headers: headers, body: jsonEncode(bodyData));

    final responseBody = json.decode(response.body);
    final Response respuesta = Response.fromJson(responseBody);

    return respuesta;
  }

  @override
  Future<List<CursoModel>> cursosByUsuario(int usuarioId, String token) async {
    final String url = '$urlBase/cursos/$usuarioId';

    final Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);

      final List<dynamic> cursoData = decodedData['msg'];
      final List<CursoModel> cursos =
          cursoData.map((curso) => CursoModel.fromJson(curso)).toList();
      return cursos;
    }
    throw Exception("Failed to fetch data: ${response.statusCode}");
  }

  @override
  Future<List<EstudianteCursoModel>> estudiantesByCurso(
      String curso, String token) async {
    final String url = '$urlBase/usuario/$curso';

    final Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);

      final List<dynamic> cursoData = decodedData['msg'];
      final List<EstudianteCursoModel> estudiantesCursos = cursoData
          .map((curso) => EstudianteCursoModel.fromJson(curso))
          .toList();
      return estudiantesCursos;
    }
    throw Exception("Failed to fetch data: ${response.statusCode}");
  }
}
