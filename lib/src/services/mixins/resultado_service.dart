
import 'package:educativa_frontend/src/models/resultado/resultado_models.dart';

mixin ResultadoService {
  Future<List<ResultadoModel>> listarResultados(String usuarioId,String token);
  
}
