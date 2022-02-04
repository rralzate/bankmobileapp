// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

import 'package:bank_app/features/credit/domain/entities/user_entity.dart';

class UserDataModel extends UserEntity {
  const UserDataModel({
    required this.primerNombre,
    this.segundoNombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.tipoDocumento,
    required this.numeroDocumento,
    this.email,
    required this.numeroCelular,
  }) : super(
            primerNombre1: primerNombre,
            segundoNombre1: segundoNombre,
            primerApellido1: primerApellido,
            segundoApellido1: segundoApellido,
            tipoDocumento1: tipoDocumento,
            numeroDocumento1: numeroDocumento,
            email1: email,
            numeroCelular1: numeroCelular);

  final String primerNombre;
  final String? segundoNombre;
  final String primerApellido;
  final String segundoApellido;
  final String tipoDocumento;
  final String numeroDocumento;
  final String? email;
  final String numeroCelular;

  factory UserDataModel.fromJson(String str) =>
      UserDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromMap(Map<String, dynamic> json) => UserDataModel(
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
