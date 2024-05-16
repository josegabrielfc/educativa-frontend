import 'package:educativa_frontend/src/models/usuario/usuario_model.dart';

import '../../models/global_models.dart';

mixin UsuarioService {
  Future<Response> registrar(
      UsuarioRegistro usuarioRegistro, String token);

}
