// To parse this JSON data, do
//
//     final centralResponseModel = centralResponseModelFromMap(jsonString);

import 'dart:convert';

import 'package:bank_app/features/credit/domain/entities/calification_response.dart';

class CalificationResponseModel extends CalificatioResponse {
  const CalificationResponseModel({required this.calificacion})
      : super(calification: calificacion);

  final String calificacion;

  factory CalificationResponseModel.fromJson(String str) =>
      CalificationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CalificationResponseModel.fromMap(Map<String, dynamic> json) =>
      CalificationResponseModel(
        calificacion: json["Calificacion"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "Calificacion": calificacion,
      };
}
