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

EstudianteModel estudianteModelFromJson(String str) => EstudianteModel.fromJson(json.decode(str));

String estudianteModelToJson(EstudianteModel data) => json.encode(data.toJson());

class EstudianteModel {
    String nombre;
    String correo;
    String id;

    EstudianteModel({
        required this.nombre,
        required this.correo,
        required this.id,
    });

    factory EstudianteModel.fromJson(Map<String, dynamic> json) => EstudianteModel(
        nombre: json["nombre"],
        correo: json["correo"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "correo": correo,
        "id": id,
    };
}



