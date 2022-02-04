import 'package:bank_app/core/util/notifications_services.dart';
import 'package:bank_app/features/credit/presentation/bloc/blocs.dart';
import 'package:bank_app/features/credit/presentation/widgets/widgets_credit.dart';

import '../../../../injection_container.dart';

import '../widgets/card_form.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SaveCreditPage extends StatelessWidget {
  const SaveCreditPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Guardar Calificación Central'),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: buildBody(context),
        ),
      ),
    );
  }
}

BlocProvider<CreditUserBloc> buildBody(BuildContext blocContext) {
  return BlocProvider(
    create: (_) => sl<CreditUserBloc>(),
    child: const CardCredit(),
  );
}

class CardCredit extends StatelessWidget {
  const CardCredit({
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
            children: const [
              SizedBox(
                height: 20,
              ),
              CreditForm(),
            ],
          ),
        )
      ],
    );
  }
}
