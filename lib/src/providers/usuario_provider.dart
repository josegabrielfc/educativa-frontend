import 'package:flutter/material.dart';

class UsuarioProvider extends ChangeNotifier {
  String? _usuarioId;
  String? _token;

  // Método para actualizar el usuario y notificar a los escuchas
  void setUsuario(String nuevoUsuarioId) {
    _usuarioId = nuevoUsuarioId;
    notifyListeners();
  }

  // Método get para obtener el usuario
  String? get usuario => _usuarioId;

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  // Método get para obtener el token
  String? get token => _token;

  void vaciarUsuarioProvider() {
    _usuarioId = null;
    _token = null;
    notifyListeners();
  }
}
