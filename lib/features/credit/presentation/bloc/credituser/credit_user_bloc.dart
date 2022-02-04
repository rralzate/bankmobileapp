import 'package:bank_app/features/credit/domain/entities/credit_entity.dart';
import 'package:bank_app/features/credit/domain/entities/user_entity.dart';
import 'package:bank_app/features/credit/domain/usescases/get_central_riesgo.dart';
import 'package:bank_app/features/credit/domain/usescases/set_credit.dart';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:bank_app/features/credit/domain/usescases/get_central_riesgo.dart'
    as riesgoparams;
import 'package:bank_app/features/credit/domain/usescases/set_credit.dart'
    as creditparams;
import 'package:flutter/material.dart';

part 'credit_user_event.dart';
part 'credit_user_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class CreditUserBloc extends Bloc<CreditUserEvent, CreditUserState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GetCentralRiesgo getCentralRiesgo;
  final SetCredit setCredit;

  CreditUserBloc({
    required this.getCentralRiesgo,
    required this.setCredit,
  }) : super(const CreditInitialState()) {
    on<GetCentralRiesgosEvent>((event, emit) async {
      getCentralRiesgo(riesgoparams.Params(userEntity: event.user));
    });

    on<OnNewCalificacion>((event, emit) {
      print('Nueva calificaicon');
      print(event.credit);
      emit(SetCreditState(event.credit));
    });

    on<OnSaveInformation>(
        (event, emit) => emit(state.copyWith(isSave: event.isSave)));

    on<ErrorEvent>(
        (event, emit) => emit(state.copyWith(errormessage: event.error)));

    on<SetDocumentoEvent>(
        (event, emit) => emit(state.copyWith(documento: event.documento)));

    on<OnIsValidForm>((event, emit) => emit(state.copyWith(isValidForm: true)));
  }

  Future getCalificacion(UserEntity user) async {
    final newCalificacionEither =
        await getCentralRiesgo(riesgoparams.Params(userEntity: user));

    //add(SetDocumentoEvent(user.numeroDocumento1));

    newCalificacionEither
        .fold((failure) => add(const ErrorEvent(SERVER_FAILURE_MESSAGE)),
            (response) async {
      CreditEntity credit = CreditEntity(
          calificacion1: response.calification,
          numeroDocumento1: user.numeroDocumento1);
      add(OnNewCalificacion(credit));
    });
  }

  Future registrarCalificacionUsuario(CreditEntity credit) async {
    final newRegistroEither =
        await setCredit(creditparams.Params(credit: credit));

    newRegistroEither.fold(
        (failure) => add(const ErrorEvent(SERVER_FAILURE_MESSAGE)), (response) {
      add(const OnSaveInformation(isSave: true));
    });
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
