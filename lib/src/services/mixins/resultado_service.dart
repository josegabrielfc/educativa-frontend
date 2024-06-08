import 'package:educativa_frontend/src/models/resultado/resultado_models.dart';
import '../../models/global_models.dart';
mixin ResultadoService {
  Future<List<ResultadoModel>> listarResultados(String usuarioId,String token);
  
  Future<Response> registrarResultado(ResultadoForm resultadoForm, String token);
}
