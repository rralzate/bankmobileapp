// To parse this JSON data, do
//
//     final registroInformacionResponse = registroInformacionResponseFromMap(jsonString);

import 'dart:convert';

class RegistroInformacionResponse {
  RegistroInformacionResponse({
    required this.mensaje,
  });

  final String mensaje;

  factory RegistroInformacionResponse.fromJson(String str) =>
      RegistroInformacionResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegistroInformacionResponse.fromMap(Map<String, dynamic> json) =>
      RegistroInformacionResponse(
        mensaje: json["Mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "Mensaje": mensaje,
      };
}
