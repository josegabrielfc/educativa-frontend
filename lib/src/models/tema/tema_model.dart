import 'dart:convert';

TemaModel temaModelFromJson(String str) => TemaModel.fromJson(json.decode(str));

String temaModelToJson(TemaModel data) => json.encode(data.toJson());

class TemaModel {
    String nombre;
    int orden;
    String id;

    TemaModel({
        required this.nombre,
        required this.orden,
        required this.id,
    });

    factory TemaModel.fromJson(Map<String, dynamic> json) => TemaModel(
        nombre: json["nombre"],
        orden: json["orden"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "orden": orden,
        "id": id,
    };
}
