
import 'package:educativa_frontend/src/models/tema/tema_model.dart';

mixin TemaService {
  Future<List<TemaModel>> listarTemas(String token);
}