import 'package:bank_app/models/models.dart';
import 'package:dio/dio.dart';

class CreditServices {
  final Dio _dioValidateUser;

  CreditServices() : _dioValidateUser = Dio();

  String? userNames;
  String? typeSerial;
  String? token;
  String? email;

  Future<Response<dynamic>?> consultarCentralRiesgos(UserModel user) async {
    const _baseUrl = 'https://banktestapi.azurewebsites.net';

    const url = _baseUrl + '/api/ConsultarCentralRiesgos';

    try {
      _dioValidateUser.options.contentType = Headers.jsonContentType;
      final response = await _dioValidateUser.post(url, data: {
        'PrimerNombre': user.primerNombre,
        'SegundoNombre': user.segundoNombre,
        'PrimerApellido': user.primerApellido,
        'SegundoApellido': user.segundoApellido,
        'TipoDocumento': user.tipoDocumento,
        'NumeroDocumento': user.numeroDocumento,
        'Email': user.email,
        'NumeroCelular': user.numeroCelular,
      });

      return response;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        return e.response;
      }
    }
  }

  Future<Response<dynamic>?> registrarCalificacionUsuario(
      CreditModel calificacion) async {
    const _baseUrl = 'https://banktestapi.azurewebsites.net';

    const url = _baseUrl + '/api/RegistrarCreditoUsuario';

    try {
      _dioValidateUser.options.contentType = Headers.jsonContentType;
      final response = await _dioValidateUser.post(url, data: {
        'NumeroDocumento': calificacion.numeroDocumento,
        'Calificacion': calificacion.calificacion,
      });

      return response;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        return e.response;
      }
    }
  }
}
