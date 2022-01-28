part of 'user_bloc.dart';

class UserState extends Equatable {
  final bool isValidForm;

  const UserState({required this.isValidForm});

  UserState copyWith({
    bool? isValidForm,
    UserModel? user,
  }) =>
      UserState(
        isValidForm: isValidForm ?? this.isValidForm,
      );

  @override
  List<Object> get props => [isValidForm];
}
