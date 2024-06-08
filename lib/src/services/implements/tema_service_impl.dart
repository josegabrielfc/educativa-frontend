import 'dart:convert';
import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/tema/tema_model.dart';
import 'package:educativa_frontend/src/services/mixins/tema_service.dart';
import 'package:http/http.dart' as http;


class TemaServiceImpl with TemaService {
  @override
  Future<List<TemaModel>> listarTemas(String token) async {
    final String url = '$urlBase/tema';

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'x-token': token
    };

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final List<dynamic> decodedData = body["msg"];
      final List<TemaModel> temas =
          decodedData.map((jsonItem) => TemaModel.fromJson(jsonItem)).toList();
      return temas;
    } else {
      return [];
    }
  }
}
