import 'package:bank_app/core/error/exceptions.dart';
import 'package:bank_app/features/credit/data/models/calification_response_model.dart';
import 'package:bank_app/features/credit/data/models/credit_data_model.dart';
import 'package:bank_app/features/credit/data/models/credit_response_model.dart';
import 'package:bank_app/features/credit/data/models/user_data_model.dart';

import 'package:bank_app/features/credit/domain/entities/credit_response.dart';
import 'package:dio/dio.dart';

abstract class CalificationRemoteDataSource {
  /// Calls the http https://banktestapi.azurewebsites.net/api/ConsultarCentralRiesgos
  ///
  /// Throws a [ServerException] for all error codes
  Future<CalificationResponseModel> getCentralRiesgos(UserDataModel user);

  /// Calls the http https://banktestapi.azurewebsites.net/api/RegistrarCreditoUsuario
  ///
  /// Throws a [ServerException] for all error codes
  Future<CreditResponse> setCredito(CreditDataModel credit);
}

class CalificationRemoteDataSourceImpl extends CalificationRemoteDataSource {
  //final http.Client client;
  final Dio dioValidateUser;

  CalificationRemoteDataSourceImpl({required this.dioValidateUser});

  @override
  Future<CalificationResponseModel> getCentralRiesgos(
      UserDataModel user) async {
    const _baseUrl = 'https://banktestapi.azurewebsites.net';

    const url = _baseUrl + '/api/ConsultarCentralRiesgos';
    try {
      dioValidateUser.options.contentType = Headers.jsonContentType;
      final response = await dioValidateUser.post(url, data: {
        'PrimerNombre': user.primerNombre,
        'SegundoNombre': user.segundoNombre,
        'PrimerApellido': user.primerApellido,
        'SegundoApellido': user.segundoApellido,
        'TipoDocumento': user.tipoDocumento,
        'NumeroDocumento': user.numeroDocumento,
        'Email': user.email,
        'NumeroCelular': user.numeroCelular,
      });

      return CalificationResponseModel.fromMap(response.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        throw ServerException();
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<CreditResponseModel> setCredito(CreditDataModel credit) async {
    const _baseUrl = 'https://banktestapi.azurewebsites.net';

    const url = _baseUrl + '/api/RegistrarCreditoUsuario';

    try {
      dioValidateUser.options.contentType = Headers.jsonContentType;
      final response = await dioValidateUser.post(url, data: {
        'NumeroDocumento': credit.numeroDocumento,
        'Calificacion': credit.calificacion,
      });

      return CreditResponseModel.fromMap(response.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        throw ServerException();
      } else {
        throw ServerException();
      }
    }
  }
}
