
import 'dart:convert';

ResultadoModel resultadoModelFromJson(String str) => ResultadoModel.fromJson(json.decode(str));

String resultadoModelToJson(ResultadoModel data) => json.encode(data.toJson());

class ResultadoModel {
    double puntaje;
    Usuario usuario;
    Tema tema;
    String id;

    ResultadoModel({
        required this.puntaje,
        required this.usuario,
        required this.tema,
        required this.id,
    });

    factory ResultadoModel.fromJson(Map<String, dynamic> json) => ResultadoModel(
        puntaje: json["puntaje"],
        usuario: Usuario.fromJson(json["usuario"]),
        tema: Tema.fromJson(json["tema"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "puntaje": puntaje,
        "usuario": usuario.toJson(),
        "tema": tema.toJson(),
        "id": id,
    };
}

class Tema {
    String id;
    String nombre;
    int orden;

    Tema({
        required this.id,
        required this.nombre,
        required this.orden,
    });

    factory Tema.fromJson(Map<String, dynamic> json) => Tema(
        id: json["_id"],
        nombre: json["nombre"],
        orden: json["orden"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "orden": orden,
    };
}

class Usuario {
    String id;
    String nombre;

    Usuario({
        required this.id,
        required this.nombre,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
    };
}


ResultadoForm resultadoFormFromJson(String str) => ResultadoForm.fromJson(json.decode(str));

String resultadoFormToJson(ResultadoForm data) => json.encode(data.toJson());

class ResultadoForm {
    double puntaje;
    String usuarioId;
    String temaId;

    ResultadoForm({
        required this.puntaje,
        required this.usuarioId,
        required this.temaId,
    });

    factory ResultadoForm.fromJson(Map<String, dynamic> json) => ResultadoForm(
        puntaje: json["puntaje"],
        usuarioId: json["usuarioId"],
        temaId: json["temaId"]
    );

    Map<String, dynamic> toJson() => {
        "puntaje": puntaje,
        "usuarioId": usuarioId,
        "temaId": temaId
    };
}