import 'package:bank_app/models/models.dart';
import 'package:bank_app/services/credit_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'credit_event.dart';
part 'credit_state.dart';

class CreditBloc extends Bloc<CreditEvent, CreditState> {
  CreditServices creditServices;

  CreditBloc({required this.creditServices}) : super(const CreditState()) {
    on<OnNewCalificacion>((event, emit) =>
        emit(state.copyWith(calificacion: event.calificacion)));
    on<OnSaveInformation>((event, emit) => emit(state.copyWith(isSave: true)));
  }

  Future getCalificacion(UserModel user) async {
    final newCalificacion = await creditServices.consultarCentralRiesgos(user);

    final centralResponse = CentralResponseModel.fromMap(newCalificacion?.data);

    add(OnNewCalificacion(centralResponse.calificacion));
  }

  Future registrarCalificacionUsuario(CreditModel calificacion) async {
    final newRegistro =
        await creditServices.registrarCalificacionUsuario(calificacion);

    if (newRegistro!.statusCode == 200) {
      final informacionResponse =
          RegistroInformacionResponse.fromMap(newRegistro.data);

      if (informacionResponse.mensaje.contains('OK')) {
        add(OnSaveInformation());
      }
    }
  }
}
