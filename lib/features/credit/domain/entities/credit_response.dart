import 'package:equatable/equatable.dart';

class CreditResponse extends Equatable {
  final String message;

  const CreditResponse({required this.message});

  @override
  List<Object?> get props => [message];
}
