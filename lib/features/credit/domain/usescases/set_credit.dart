import 'package:bank_app/features/credit/data/models/credit_data_model.dart';
import 'package:bank_app/features/credit/domain/entities/credit_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usescases/usescases.dart';
import '../entities/credit_response.dart';
import '../repositories/credit_repository.dart';

class SetCredit implements UseCase<CreditResponse, Params> {
  final CreditReposiroty respository;

  SetCredit(this.respository);

  @override
  Future<Either<Failure, CreditResponse>> call(Params params) async {
    return await respository.setCredito(params.credit);
  }
}

class Params extends Equatable {
  final CreditEntity credit;

  const Params({required this.credit});

  @override
  List<Object?> get props => [credit];
}
