import 'package:bank_app/features/credit/data/models/user_data_model.dart';
import 'package:bank_app/features/credit/domain/entities/user_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usescases/usescases.dart';
import '../entities/calification_response.dart';

import '../repositories/credit_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCentralRiesgo implements UseCase<CalificatioResponse, Params> {
  final CreditReposiroty respository;

  GetCentralRiesgo(this.respository);

  @override
  Future<Either<Failure, CalificatioResponse>> call(Params params) async {
    return await respository.getCentralRiesgos(params.userEntity);
  }
}

class Params extends Equatable {
  final UserEntity userEntity;

  const Params({required this.userEntity});

  @override
  List<Object?> get props => [userEntity];
}
