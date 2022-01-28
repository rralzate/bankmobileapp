part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class OnIngresaUsuario extends UserEvent {
  final UserModel user;

  const OnIngresaUsuario(this.user);
}

class OnIsValidForm extends UserEvent {}
