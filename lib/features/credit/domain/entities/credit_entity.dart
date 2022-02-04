import 'package:equatable/equatable.dart';

class CreditEntity extends Equatable {
  final String numeroDocumento1;
  final String calificacion1;

  const CreditEntity({
    required this.numeroDocumento1,
    required this.calificacion1,
  });

  @override
  List<Object> get props => [
        numeroDocumento1,
        calificacion1,
      ];
}
