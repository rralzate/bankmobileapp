import 'package:bank_app/core/util/notifications_services.dart';
import 'package:bank_app/features/credit/presentation/bloc/blocs.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CreditForm extends StatefulWidget {
  const CreditForm({Key? key}) : super(key: key);

  @override
  State<CreditForm> createState() => _CreditFormState();
}

class _CreditFormState extends State<CreditForm> {
  @override
  Widget build(BuildContext context) {
    final creditBloc = BlocProvider.of<CreditUserBloc>(context, listen: false);

    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Text(
              'La calificación del usuario en la central de riesgo es: ',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                disabledColor: Theme.of(context).colorScheme.secondary,
                elevation: 0,
                color: Theme.of(context).colorScheme.secondary,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  child: const Text('Guardar Calificación',
                      style: TextStyle(color: Colors.white)),
                ),
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  NotificationsService.showDefaultDialog(
                      'Procesando...', context);

                  print(creditBloc.state.credit);

                  if (creditBloc.state.credit != null) {
                    await creditBloc
                        .registrarCalificacionUsuario(creditBloc.state.credit!);
                  }

                  NotificationsService.showSnackBar(
                      'Hola', 'Información registrada correctamente');

                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, 'home');
                })
          ],
        ));
  }
}
