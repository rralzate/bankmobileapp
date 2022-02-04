import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String primerNombre1;
  final String? segundoNombre1;
  final String primerApellido1;
  final String segundoApellido1;
  final String tipoDocumento1;
  final String numeroDocumento1;
  final String? email1;
  final String numeroCelular1;

  const UserEntity(
      {required this.primerNombre1,
      this.segundoNombre1,
      required this.primerApellido1,
      required this.segundoApellido1,
      required this.tipoDocumento1,
      required this.numeroDocumento1,
      this.email1,
      required this.numeroCelular1});

  @override
  List<Object?> get props => [
        primerNombre1,
        segundoNombre1,
        segundoApellido1,
        tipoDocumento1,
        numeroDocumento1,
        email1,
        numeroCelular1
      ];
}
