import 'package:bank_app/blocs/user/user_bloc.dart';
import 'package:bank_app/pages/form_credit_page.dart';
import 'package:bank_app/pages/home_page.dart';
import 'package:bank_app/services/credit_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'blocs/credit/credit_bloc.dart';
import 'theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(
            create: (_) => CreditBloc(creditServices: CreditServices()))
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crédito App',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'form': (_) => const FormCreditPage(),
        },
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
