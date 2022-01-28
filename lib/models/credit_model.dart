// To parse this JSON data, do
//
//     final creditModel = creditModelFromMap(jsonString);

import 'dart:convert';

class CreditModel {
  CreditModel({
    required this.numeroDocumento,
    required this.calificacion,
  });

  final String numeroDocumento;
  final String calificacion;

  factory CreditModel.fromJson(String str) =>
      CreditModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreditModel.fromMap(Map<String, dynamic> json) => CreditModel(
        numeroDocumento: json["NumeroDocumento"],
        calificacion: json["Calificacion"],
      );

  Map<String, dynamic> toMap() => {
        "NumeroDocumento": numeroDocumento,
        "Calificacion": calificacion,
      };
}
