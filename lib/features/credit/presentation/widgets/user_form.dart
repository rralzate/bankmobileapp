import 'package:bank_app/core/util/notifications_services.dart';

import 'package:bank_app/features/credit/domain/entities/user_entity.dart';
import 'package:bank_app/features/credit/presentation/bloc/credituser/credit_user_bloc.dart';

import '../ui/input_decorations.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final primerNombreController = TextEditingController();
  final segundoNombreController = TextEditingController();
  final primerApellidoController = TextEditingController();
  final segundoApellidoController = TextEditingController();
  final tipoDocumentoController = TextEditingController();
  final numeroDocumentoController = TextEditingController();
  final emailController = TextEditingController();
  final numeroCelularController = TextEditingController();

  @override
  void dispose() {
    primerNombreController.dispose();
    segundoNombreController.dispose();
    primerApellidoController.dispose();
    segundoApellidoController.dispose();
    tipoDocumentoController.dispose();
    numeroDocumentoController.dispose();
    emailController.dispose();
    numeroCelularController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final creditBloc = BlocProvider.of<CreditUserBloc>(context);

    return Form(
        key: creditBloc.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              controller: primerNombreController,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.formInputDecoration(
                hintText: 'Ingrese el primer nombre',
                labelText: 'Primer nombre (*)',
              ),
              validator: (value) {
                return value!.isEmpty ? 'El primer nombre es requerido' : null;
              },
            ),
            TextFormField(
              autocorrect: false,
              controller: segundoNombreController,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.formInputDecoration(
                hintText: 'Ingrese el segundo nombre',
                labelText: 'Segundo nombre',
              ),
            ),
            TextFormField(
              autocorrect: false,
              controller: primerApellidoController,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.formInputDecoration(
                hintText: 'Ingrese el Primer Apellido',
                labelText: 'Primer Apellido (*)',
              ),
              validator: (value) {
                return value!.isEmpty
                    ? 'El Primer Apellido es requerido'
                    : null;
              },
            ),
            TextFormField(
              autocorrect: false,
              controller: segundoApellidoController,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.formInputDecoration(
                hintText: 'Ingrese el Segundo Apellido',
                labelText: 'Segundo Apellido (*)',
              ),
              validator: (value) {
                return value!.isEmpty
                    ? 'El Segundo Apellido es requerido'
                    : null;
              },
            ),
            TextFormField(
              autocorrect: false,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.formInputDecoration(
                hintText: 'Ingrese el Email',
                labelText: 'Email',
              ),
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El correo electrónico no es correcto';
              },
            ),
            TextFormField(
              autocorrect: false,
              controller: tipoDocumentoController,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.formInputDecoration(
                hintText: 'Ingrese el Tipo De Documento',
                labelText: 'Tipo de Documento (*)',
              ),
              validator: (value) {
                return value!.isEmpty
                    ? 'El Tipo de Documento es requerido'
                    : null;
              },
            ),
            TextFormField(
              autocorrect: false,
              controller: numeroDocumentoController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecorations.formInputDecoration(
                hintText: 'Ingrese el Número de Documento',
                labelText: 'Número de Documento (*)',
              ),
              validator: (value) {
                return value!.isEmpty
                    ? 'El Número de Documento es requerido'
                    : null;
              },
            ),
            TextFormField(
              autocorrect: false,
              controller: numeroCelularController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecorations.formInputDecoration(
                hintText: 'Ingrese el Número de Celular',
                labelText: 'Número de Celular (*)',
              ),
              validator: (value) {
                return value!.isEmpty
                    ? 'El Número de Celular es requerido'
                    : null;
              },
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
                child: const Text('Consultar Central',
                    style: TextStyle(color: Colors.white)),
              ),
              onPressed: () async {
                FocusScope.of(context).unfocus();

                print(creditBloc.state.isValidForm);

                if (!creditBloc.isValidForm()) return;

                creditBloc.add(OnIsValidForm());

                UserEntity user = UserEntity(
                    primerNombre1: primerNombreController.text,
                    segundoNombre1: segundoNombreController.text,
                    primerApellido1: primerApellidoController.text,
                    segundoApellido1: segundoApellidoController.text,
                    tipoDocumento1: tipoDocumentoController.text,
                    numeroDocumento1: numeroDocumentoController.text,
                    email1: emailController.text,
                    numeroCelular1: numeroCelularController.text);

                NotificationsService.showDefaultDialog(
                    'Procesando...', context);

                await creditBloc.getCalificacion(user);

                if (creditBloc.state.credit != null) {
                  await creditBloc
                      .registrarCalificacionUsuario(creditBloc.state.credit!);
                }

                NotificationsService.showSnackBar(
                    'Hola', 'Información registrada correctamente');

                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, 'home');
              },
            )
          ],
        ));
  }
}
