import 'package:equatable/equatable.dart';

class CalificatioResponse extends Equatable {
  final String calification;

  const CalificatioResponse({required this.calification, calificacion});

  @override
  List<Object?> get props => [calification];
}
