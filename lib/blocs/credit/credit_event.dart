part of 'credit_bloc.dart';

abstract class CreditEvent extends Equatable {
  const CreditEvent();

  @override
  List<Object> get props => [];
}

class OnNewCalificacion extends CreditEvent {
  final String calificacion;

  const OnNewCalificacion(this.calificacion);
}

class OnSaveInformation extends CreditEvent {}
