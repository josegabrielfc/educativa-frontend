import 'package:educativa_frontend/src/models/tema/tema_model.dart';
import 'package:flutter/material.dart';

class UsuarioProvider extends ChangeNotifier {
  String? _usuarioId;
  String? _token;
  List<TemaModel>? _temas;
  String? _estudianteId;

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

  // Método para actualizar los temas y notificar a los escuchas
  void setTemas(List<TemaModel> temas) {
    _temas = temas;
    notifyListeners();
  }

  List<TemaModel>? get temas => _temas;

  // Método para buscar un tema por nombre
  String? buscarTemaPorNombre(String nombre) {
    try {
      return _temas?.firstWhere((tema) => tema.nombre == nombre).id;
    } catch (e) {
      return ""; // Retorna "" si no encuentra el tema
    }
  }
  
  // Método para actualizar el estudiante y notificar a los escuchas
  void setEstudiante(String nuevoEstudianteId) {
    _estudianteId = nuevoEstudianteId;
    notifyListeners();
  }

  // Método get para obtener el estudiante
  String? get estudiante => _estudianteId;

  void vaciarUsuarioProvider() {
    _usuarioId = null;
    _token = null;
    _estudianteId = null;
    _temas = [];
    notifyListeners();
  }
}
