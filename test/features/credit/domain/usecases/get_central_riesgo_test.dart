import 'package:bank_app/features/credit/data/models/calification_response_model.dart';
import 'package:bank_app/features/credit/data/models/user_data_model.dart';
import 'package:bank_app/features/credit/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bank_app/features/credit/domain/usescases/get_central_riesgo.dart';

import 'package:bank_app/features/credit/domain/repositories/credit_repository.dart';

class MockCentralRiesgoRepository extends Mock implements CreditReposiroty {}

void main() {
  late GetCentralRiesgo usecase;

  late MockCentralRiesgoRepository mockCentralRiesgoRepository;

  setUp(() {
    mockCentralRiesgoRepository = MockCentralRiesgoRepository();
    usecase = GetCentralRiesgo(mockCentralRiesgoRepository);
  });

  UserEntity tUser = const UserEntity(
    primerNombre1: "Ricardo",
    segundoNombre1: "",
    primerApellido1: "Reyes",
    segundoApellido1: "Alzate",
    tipoDocumento1: "CC",
    email1: "reyes160@gmail.com",
    numeroDocumento1: "7500024455",
    numeroCelular1: "3166540958",
  );

  CalificationResponseModel calificationResponse =
      const CalificationResponseModel(calificacion: 'A');

  test('Should Get Calification from Central Riesgo Repository', () async {
    // arrange
    when(mockCentralRiesgoRepository.getCentralRiesgos(tUser))
        .thenAnswer((_) async => Right(calificationResponse));

    //act
    final result = await usecase(Params(userEntity: tUser));

    //assert
    expect(result, Right(calificationResponse));
    verify(mockCentralRiesgoRepository.getCentralRiesgos(tUser));
    verifyNoMoreInteractions(mockCentralRiesgoRepository);
  });
}
