import 'dart:convert';

UsuarioRegistro usuarioRegistroFromJson(String str) =>
    UsuarioRegistro.fromJson(json.decode(str));

String usuarioRegistroToJson(UsuarioRegistro data) =>
    json.encode(data.toJson());

class UsuarioRegistro {
  String nombre;

  String correo;
  String contrasena;

  UsuarioRegistro(
      {required this.nombre,
      required this.correo,
      required this.contrasena});

  factory UsuarioRegistro.fromJson(Map<String, dynamic> json) =>
      UsuarioRegistro(
          nombre: json["nombre"],
          correo: json["correo"],
          contrasena: json["contrasena"]
  );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "correo": correo,
        "contrasena": contrasena,
      };
}


