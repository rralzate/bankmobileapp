// To parse this JSON data, do
//
//     final centralResponseModel = centralResponseModelFromMap(jsonString);

import 'dart:convert';

class CentralResponseModel {
  CentralResponseModel({
    required this.calificacion,
  });

  final String calificacion;

  factory CentralResponseModel.fromJson(String str) =>
      CentralResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CentralResponseModel.fromMap(Map<String, dynamic> json) =>
      CentralResponseModel(
        calificacion: json["Calificacion"],
      );

  Map<String, dynamic> toMap() => {
        "Calificacion": calificacion,
      };
}
