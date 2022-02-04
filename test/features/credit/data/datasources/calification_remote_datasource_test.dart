import 'dart:convert';

import 'package:bank_app/core/error/exceptions.dart';
import 'package:bank_app/features/credit/data/datasources/calification_remote_datasource.dart';
import 'package:bank_app/features/credit/data/models/calification_response_model.dart';
import 'package:bank_app/features/credit/data/models/user_data_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart' as dio;

import '../../../../fixtures/fixtures_reader.dart';

class MockHttpClient extends Mock implements dio.Dio {}

void main() {
  late CalificationRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource =
        CalificationRemoteDataSourceImpl(dioValidateUser: mockHttpClient);
  });

  UserDataModel userModel = const UserDataModel(
      primerNombre: "Ricardo",
      segundoNombre: "",
      primerApellido: "Reyes",
      segundoApellido: "Alzate",
      tipoDocumento: "CC",
      email: "reyes160@gmail.com",
      numeroDocumento: "7500024455",
      numeroCelular: "3166540958");

  const _baseUrl = 'https://banktestapi.azurewebsites.net';

  const url = _baseUrl + '/api/ConsultarCentralRiesgos';

  Uri uri = Uri();

  void setUpMockClientSuccess200() {
    mockHttpClient.options.contentType = dio.Headers.jsonContentType;
    when(mockHttpClient.post(
      url,
      data: jsonEncode(userModel),
    )).thenThrow(dio.DioError(
        requestOptions: dio.RequestOptions(
            method: 'POST', path: '/api/ConsultarCentralRiesgos'),
        response: dio.Response(
            requestOptions: dio.RequestOptions(
                method: 'POST', path: '/api/ConsultarCentralRiesgos'),
            statusCode: 200,
            statusMessage: 'Something went wrong')));
  }

  void setUpMockClientFaulure404() {
    mockHttpClient.options.contentType = dio.Headers.jsonContentType;
    when(mockHttpClient.post(url, data: jsonEncode(userModel))).thenThrow(
        dio.DioError(
            requestOptions: dio.RequestOptions(
                method: 'POST', path: '/api/ConsultarCentralRiesgos'),
            response: dio.Response(
                requestOptions: dio.RequestOptions(
                    method: 'POST', path: '/api/ConsultarCentralRiesgos'),
                statusCode: 404,
                statusMessage: 'Something went wrong')));
  }

  final tCalificationResponseModel = CalificationResponseModel.fromJson(
      fixture('ConsultarCentralRiesgos.json'));

  group('getCentralRiesgos', () {
    test(
        'Should perform a GET request on a URL with getCentralRiesgos with applicatio/json',
        () async {
      setUpMockClientSuccess200();

      //act
      dataSource.getCentralRiesgos(userModel);

      //assert
      mockHttpClient.options.contentType = dio.Headers.jsonContentType;
      verify(mockHttpClient.post(url, data: jsonEncode(userModel)));
    });

    test('Should return Calification when the response code is 200 Success',
        () async {
      setUpMockClientSuccess200();

      //act
      final result = await dataSource.getCentralRiesgos(userModel);

      //assert
      expect(result, equals(tCalificationResponseModel));
    });

    test(
        'Should throw s server exception when the response code is 200 Success',
        () async {
      setUpMockClientFaulure404();
      //act
      final call = dataSource.getCentralRiesgos;

      //assert
      expect(
          () => call(userModel), throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
