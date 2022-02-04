import 'package:bank_app/core/error/failures.dart';
import 'package:bank_app/core/network/network_info.dart';
import 'package:bank_app/features/credit/data/datasources/calification_remote_datasource.dart';
import 'package:bank_app/features/credit/data/datasources/user_local_datasource.dart';
import 'package:bank_app/features/credit/data/models/calification_response_model.dart';

import 'package:bank_app/features/credit/data/models/user_data_model.dart';
import 'package:bank_app/features/credit/data/repositories/credit_repository_impl.dart';
import 'package:bank_app/features/credit/domain/entities/calification_response.dart';

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteDataSource extends Mock
    implements CalificationRemoteDataSource {}

class MockLocalDataSource extends Mock implements UserLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

@GenerateMocks([NetworkInfo])
void main() {
  late CreditRepositoryImpl repositoryImpl;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = CreditRepositoryImpl(
      calificationRemoteDataSource: mockRemoteDataSource,
      userLocalDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestOnline(Function body) {
    group('Device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runTestOffline(Function body) {
    group('Device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  UserDataModel userModel = const UserDataModel(
      primerNombre: "Ricardo",
      segundoNombre: "",
      primerApellido: "Reyes",
      segundoApellido: "Alzate",
      tipoDocumento: "CC",
      email: "reyes160@gmail.com",
      numeroDocumento: "7500024455",
      numeroCelular: "3166540958");

  const tCalificationResponse =
      const CalificationResponseModel(calificacion: 'AA');

  group('getCentralRiesgos', () {
    //final CalificationResponse tCalificationResponse = tCalificationModel;

    test('Should check if the device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      await repositoryImpl.getCentralRiesgos(userModel);

      verify(mockNetworkInfo.isConnected);
    });
  });

  runTestOnline(() {
    test(
        'Should return remote data when thew call remote data spource is succesfull',
        () async {
      //arrange
      when(mockRemoteDataSource.getCentralRiesgos(userModel))
          .thenAnswer((_) async => tCalificationResponse);

      //act
      final result = await repositoryImpl.getCentralRiesgos(userModel);

      //assert
      verify(mockRemoteDataSource.getCentralRiesgos(userModel));
      expect(result, equals(const Right(tCalificationResponse)));
    });

    test(
        'Should cache the data locally when thew call remote data source is succesfull',
        () async {
      //arrange
      when(mockRemoteDataSource.getCentralRiesgos(userModel))
          .thenAnswer((_) async => tCalificationResponse);

      //act
      await repositoryImpl.getCentralRiesgos(userModel);

      //assert
      verify(mockRemoteDataSource.getCentralRiesgos(userModel));
      //verify(mockLocalDataSource.cacheUserBasicData(userModel));
    });

    test(
        'Should return remote failure  data when thew call remote data spource is unsuccesfull',
        () async {
      //arrange
      when(mockRemoteDataSource.getCentralRiesgos(userModel))
          .thenAnswer((_) async => tCalificationResponse);

      //act
      final result = await repositoryImpl.getCentralRiesgos(userModel);

      //assert
      verify(mockRemoteDataSource.getCentralRiesgos(userModel));
      verifyZeroInteractions(mockRemoteDataSource);
      expect(result, equals(left(ServerFailure())));
    });
  });

  runTestOffline(() {});
}
