import 'package:bank_app/features/credit/presentation/bloc/blocs.dart';
import 'package:bank_app/features/credit/presentation/widgets/widgets_credit.dart';

import '../../../../injection_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormCreditPage extends StatelessWidget {
  const FormCreditPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Solicitar crédito'),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: buildBody(context),
        ),
      ),
    );
  }
}

BlocProvider<CreditUserBloc> buildBody(BuildContext context) {
  return BlocProvider(
    create: (_) => sl<CreditUserBloc>(),
    child: const CardUserData(),
  );
}

class CardUserData extends StatelessWidget {
  const CardUserData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        CardForm(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Datos del usuario',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<CreditUserBloc, CreditUserState>(
                builder: (context, state) {
                  return const UserForm();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
