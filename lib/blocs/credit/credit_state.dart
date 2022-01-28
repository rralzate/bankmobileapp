part of 'credit_bloc.dart';

class CreditState extends Equatable {
  final String calificacion;
  final bool isSave;

  const CreditState({this.calificacion = '', this.isSave = false});

  CreditState copyWith({String? calificacion, bool? isSave}) => CreditState(
        calificacion: calificacion ?? this.calificacion,
        isSave: isSave ?? this.isSave,
      );

  @override
  List<Object> get props => [calificacion, isSave];
}
