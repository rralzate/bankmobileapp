import 'package:bank_app/features/credit/domain/entities/calification_response.dart';
import 'package:bank_app/features/credit/domain/entities/user_entity.dart';
import 'package:bank_app/features/credit/domain/usescases/get_central_riesgo.dart';
import 'package:bank_app/features/credit/domain/usescases/set_credit.dart';
import 'package:bank_app/features/credit/presentation/bloc/blocs.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bank_app/features/credit/domain/usescases/get_central_riesgo.dart'
    as riesgoparams;

class MockGetCentralRiesgo extends Mock implements GetCentralRiesgo {}

class MockSetCredit extends Mock implements SetCredit {}

void main() {
  late CreditUserBloc bloc;
  late MockGetCentralRiesgo mockGetCentralRiesgo;
  late MockSetCredit mockSetCredit;

  setUp(() {
    mockGetCentralRiesgo = MockGetCentralRiesgo();
    mockSetCredit = MockSetCredit();

    bloc = CreditUserBloc(
        getCentralRiesgo: mockGetCentralRiesgo, setCredit: mockSetCredit);
  });

  group('GetCentralRiesgo', () {
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

    CalificatioResponse tResponse =
        const CalificatioResponse(calification: 'AA');

    test('Should get data from the Central Riesgo Case', () async {
      //Arrange
      when(mockGetCentralRiesgo(riesgoparams.Params(userEntity: tUser)))
          .thenAnswer((_) async => Right(tResponse));

      //act
      bloc.add(GetCentralRiesgosEvent(tUser));
      await untilCalled(
          mockGetCentralRiesgo(riesgoparams.Params(userEntity: tUser)));

      //assert
      verify(mockGetCentralRiesgo(riesgoparams.Params(userEntity: tUser)));
    });

    test('Should get data from the Central Riesgo Case', () async {
      //Arrange
      when(mockGetCentralRiesgo(riesgoparams.Params(userEntity: tUser)))
          .thenAnswer((_) async => Right(tResponse));

      // final expected = [
      //   Empty(),
      //   LoadingState(tUser),
      //   LoadedState(calification: tResponse.calification)
      // ];

      // expectLater(bloc.state, emitsInOrder(expected));

      //act
      bloc.add(GetCentralRiesgosEvent(tUser));
    });
  });
}
