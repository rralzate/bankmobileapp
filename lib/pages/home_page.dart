import 'package:bank_app/pages/form_credit_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Fondo.jpg'), fit: BoxFit.cover)),
        child: Center(
          child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              disabledColor: Theme.of(context).colorScheme.secondary,
              elevation: 0,
              color: Theme.of(context).colorScheme.secondary,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                child: const Text('Solicitar crédito',
                    style: TextStyle(color: Colors.white)),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'form');
              }),
        ),
      ),
    );
  }
}
