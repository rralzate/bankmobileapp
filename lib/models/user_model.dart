// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

class UserModel {
  UserModel({
    required this.primerNombre,
    this.segundoNombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.tipoDocumento,
    required this.numeroDocumento,
    this.email,
    required this.numeroCelular,
  });

  final String primerNombre;
  final String? segundoNombre;
  final String primerApellido;
  final String segundoApellido;
  final String tipoDocumento;
  final String numeroDocumento;
  final String? email;
  final String numeroCelular;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        primerNombre: json["PrimerNombre"],
        segundoNombre: json["SegundoNombre"],
        primerApellido: json["PrimerApellido"],
        segundoApellido: json["SegundoApellido"],
        tipoDocumento: json["TipoDocumento"],
        numeroDocumento: json["NumeroDocumento"],
        email: json["Email"],
        numeroCelular: json["NumeroCelular"],
      );

  Map<String, dynamic> toMap() => {
        "PrimerNombre": primerNombre,
        "SegundoNombre": segundoNombre,
        "PrimerApellido": primerApellido,
        "SegundoApellido": segundoApellido,
        "TipoDocumento": tipoDocumento,
        "NumeroDocumento": numeroDocumento,
        "Email": email,
        "NumeroCelular": numeroCelular,
      };
}
