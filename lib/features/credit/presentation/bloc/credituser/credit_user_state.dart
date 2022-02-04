part of 'credit_user_bloc.dart';

class CreditUserState extends Equatable {
  final bool isSave;
  final String calificacion;
  final String documento;
  final String errormessage;
  final CreditEntity? credit;
  final bool isValidForm;

  const CreditUserState(
      {required this.isValidForm,
      this.calificacion = '',
      this.isSave = false,
      this.errormessage = '',
      this.documento = '',
      this.credit});

  CreditUserState copyWith({
    String? calificacion,
    bool? isSave,
    String? errormessage,
    String? documento,
    bool? isValidForm,
  }) =>
      CreditUserState(
        calificacion: calificacion ?? this.calificacion,
        isSave: isSave ?? this.isSave,
        errormessage: errormessage ?? this.errormessage,
        documento: documento ?? this.documento,
        isValidForm: isValidForm ?? this.isValidForm,
      );

  @override
  List<Object> get props =>
      [calificacion, isSave, errormessage, documento, isValidForm];
}

class CreditInitialState extends CreditUserState {
  const CreditInitialState() : super(credit: null, isValidForm: false);
}

class SetCreditState extends CreditUserState {
  final CreditEntity newCredit;

  const SetCreditState(this.newCredit)
      : super(credit: newCredit, isValidForm: true);
}

class Error extends CreditUserState {
  final String message;

  const Error({required this.message})
      : super(credit: null, isValidForm: false);

  @override
  List<Object> get props => [message];
}
