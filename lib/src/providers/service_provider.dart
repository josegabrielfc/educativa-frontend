import 'package:educativa_frontend/src/services/implements/resultado_service_impl.dart';
import 'package:educativa_frontend/src/services/mixins/resultado_service.dart';
import 'package:flutter/material.dart';
import 'package:educativa_frontend/src/services/implements/login_service_impl.dart';
import 'package:educativa_frontend/src/services/implements/usuario_service_impl.dart';
import 'package:educativa_frontend/src/services/mixins/login_service.dart';
import 'package:educativa_frontend/src/services/mixins/usuario_service.dart';

class ServicesProvider extends ChangeNotifier {
  final LoginService _loginService = LoginServiceImlp();
  final UsuarioService _usuarioService = UsuarioServiceImlp();
  final ResultadoService _resultadoService = ResultadoServiceImlp();

  LoginService get loginService {
    return _loginService;
  }

  UsuarioService get usuarioService {
    return _usuarioService;
  }

  ResultadoService get resultadoService {
    return _resultadoService;
  }
}
