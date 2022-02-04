// To parse this JSON data, do
//
//     final registroInformacionResponse = registroInformacionResponseFromMap(jsonString);

import 'dart:convert';

import 'package:bank_app/features/credit/domain/entities/credit_response.dart';

class CreditResponseModel extends CreditResponse {
  const CreditResponseModel({
    required this.mensaje,
  }) : super(message: mensaje);

  final String mensaje;

  factory CreditResponseModel.fromJson(String str) =>
      CreditResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreditResponseModel.fromMap(Map<String, dynamic> json) =>
      CreditResponseModel(
        mensaje: json["Mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "Mensaje": mensaje,
      };
}
