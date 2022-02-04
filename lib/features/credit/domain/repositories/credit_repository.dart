import 'package:bank_app/features/credit/data/models/calification_response_model.dart';
import 'package:bank_app/features/credit/data/models/credit_data_model.dart';
import 'package:bank_app/features/credit/data/models/user_data_model.dart';
import 'package:bank_app/features/credit/domain/entities/credit_entity.dart';
import 'package:bank_app/features/credit/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/calification_response.dart';

import '../entities/credit_response.dart';

abstract class CreditReposiroty {
  Future<Either<Failure, CalificatioResponse>> getCentralRiesgos(
      UserEntity user);

  Future<Either<Failure, CreditResponse>> setCredito(CreditEntity credit);
}
