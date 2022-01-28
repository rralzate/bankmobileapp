import 'package:bank_app/models/models.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  UserBloc() : super(const UserState(isValidForm: false)) {
    on<OnIsValidForm>(
        (event, emit) => emit(state.copyWith(isValidForm: false)));
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
