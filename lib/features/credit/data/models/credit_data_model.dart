// To parse this JSON data, do
//
//     final creditModel = creditModelFromMap(jsonString);

import 'dart:convert';

import 'package:bank_app/features/credit/domain/entities/credit_entity.dart';

class CreditDataModel extends CreditEntity {
  const CreditDataModel({
    required this.numeroDocumento,
    required this.calificacion,
  }) : super(
          numeroDocumento1: numeroDocumento,
          calificacion1: calificacion,
        );

  final String numeroDocumento;
  final String calificacion;

  factory CreditDataModel.fromJson(String str) =>
      CreditDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreditDataModel.fromMap(Map<String, dynamic> json) => CreditDataModel(
        numeroDocumento: json["NumeroDocumento"],
        calificacion: json["Calificacion"],
      );

  Map<String, dynamic> toMap() => {
        "NumeroDocumento": numeroDocumento,
        "Calificacion": calificacion,
      };
}
