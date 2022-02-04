import 'package:bank_app/core/error/exceptions.dart';
import 'package:bank_app/features/credit/data/models/credit_data_model.dart';

import 'package:bank_app/features/credit/data/models/user_data_model.dart';
import 'package:bank_app/features/credit/domain/entities/credit_entity.dart';
import 'package:bank_app/features/credit/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/calification_response.dart';

import '../../domain/entities/credit_response.dart';

import '../../domain/repositories/credit_repository.dart';
import '../datasources/calification_remote_datasource.dart';
import '../datasources/user_local_datasource.dart';

class CreditRepositoryImpl implements CreditReposiroty {
  final CalificationRemoteDataSource calificationRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;
  final NetworkInfo networkInfo;

  CreditRepositoryImpl(
      {required this.calificationRemoteDataSource,
      required this.userLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, CalificatioResponse>> getCentralRiesgos(
      UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        UserDataModel userModel = UserDataModel(
          primerNombre: user.primerNombre1,
          segundoNombre: user.segundoNombre1,
          primerApellido: user.primerApellido1,
          segundoApellido: user.segundoApellido1,
          tipoDocumento: user.tipoDocumento1,
          email: user.email1,
          numeroDocumento: user.numeroDocumento1,
          numeroCelular: user.numeroCelular1,
        );

        return Right(
            await calificationRemoteDataSource.getCentralRiesgos(userModel));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, CreditResponse>> setCredito(
      CreditEntity credit) async {
    if (await networkInfo.isConnected) {
      try {
        CreditDataModel crediModel = CreditDataModel(
            calificacion: credit.calificacion1,
            numeroDocumento: credit.numeroDocumento1);

        return Right(await calificationRemoteDataSource.setCredito(crediModel));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(CacheFailure());
    }
  }
}
