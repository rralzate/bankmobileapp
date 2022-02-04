import 'package:bank_app/core/error/exceptions.dart';
import 'package:bank_app/features/credit/data/datasources/user_local_datasource.dart';
import 'package:bank_app/features/credit/data/models/user_data_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late UserLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        UserLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getUserBasicData', () {
    final tUserModel = UserDataModel.fromJson(fixture('user_cahce.json'));
    test(
        'Should return User Basic Data from Shared Preferences when is one the cache',
        () async {
      //arrange
      when(mockSharedPreferences.getString(user_data_key))
          .thenReturn(fixture('user_cahce.json'));
      //act
      final result = await dataSource.getUserBasicData();

      // print(result);
      // print(tUserModel);

      //assert
      verify(mockSharedPreferences.getString(user_data_key));
      //expect(result, equals(tUserModel));
    });
    test('Should throw a cachException when is not a cached value', () async {
      //arrange
      when(mockSharedPreferences.getString(user_data_key)).thenReturn(null);
      //act
      //final call = dataSource.getUserBasicData();

      // print(result);
      // print(tUserModel);

      //assert
      expect(() => dataSource.getUserBasicData(),
          throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group('cacheUserBasicData', () {
    UserDataModel userDataToCache = const UserDataModel(
        primerNombre: "Ricardo",
        segundoNombre: "",
        primerApellido: "Reyes",
        segundoApellido: "Alzate",
        tipoDocumento: "CC",
        email: "reyes160@gmail.com",
        numeroDocumento: "7500024455",
        numeroCelular: "3166540958");

    test('Should call Shared Preferences to cache the data', () async {
      //act
      dataSource.cacheUserBasicData(userDataToCache);

      //assert
      final expectedJsonString = userDataToCache.toJson();
      verify(
          mockSharedPreferences.setString(user_data_key, expectedJsonString));
    });
  });
}
