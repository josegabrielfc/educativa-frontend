import 'dart:convert';
import 'package:educativa_frontend/src/models/global_models.dart';
import 'package:educativa_frontend/src/models/resultado/resultado_models.dart';
import 'package:educativa_frontend/src/services/mixins/resultado_service.dart';
import 'package:http/http.dart' as http;

import '../../config/environment/environment.dart';

class ResultadoServiceImlp with ResultadoService {
  @override
  Future<List<ResultadoModel>> listarResultados(String usuarioId, String token) async {
    final String url = '$urlBase/resultado/$usuarioId';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'x-token': token,
    };

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    final responseBody = json.decode(response.body);
    if (responseBody["type"] == "success") {
      final List<dynamic> resultadosJson = responseBody["msg"];
      List<ResultadoModel> resultados = resultadosJson.map((json) => ResultadoModel.fromJson(json)).toList();
      return resultados;
    } else {
      return [];
    }
  }

  @override
  Future<Response> registrarResultado(ResultadoForm resultadoForm, String token) async {
    final String url = '$urlBase/resultado/registrar';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'x-token': token,
    };

    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(resultadoForm)
    );

    final responseBody = json.decode(response.body);
    return Response.fromJson(responseBody);
  }
}