import 'package:bank_app/features/credit/presentation/pages/save_credit_page.dart';

import 'features/credit/presentation/pages/form_credit_page.dart';
import 'features/credit/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme/app_theme.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crédito App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'form': (_) => const FormCreditPage(),
        'save': (_) => const SaveCreditPage(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}
