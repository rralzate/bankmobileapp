part of 'credit_user_bloc.dart';

abstract class CreditUserEvent extends Equatable {
  const CreditUserEvent();

  @override
  List<Object> get props => [];
}

class GetCentralRiesgosEvent extends CreditUserEvent {
  final UserEntity user;

  const GetCentralRiesgosEvent(this.user);
}

class SetDocumentoEvent extends CreditUserEvent {
  final String documento;

  const SetDocumentoEvent(this.documento);
}

class OnNewCalificacion extends CreditUserEvent {
  final CreditEntity credit;

  const OnNewCalificacion(this.credit);
}

class OnSaveInformation extends CreditUserEvent {
  final bool isSave;

  const OnSaveInformation({required this.isSave});
}

class ErrorEvent extends CreditUserEvent {
  final String error;

  const ErrorEvent(this.error);
}

class OnIsValidForm extends CreditUserEvent {}
