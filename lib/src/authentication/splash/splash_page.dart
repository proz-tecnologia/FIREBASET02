import 'package:class_finance_app/src/authentication/splash/splash_controller.dart';
import 'package:class_finance_app/src/authentication/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        bloc: Modular.get<SplashBloc>()..setup(),
        listener: (context, state) {
          if (state is SplashStateLogged) {
            Modular.to.pushReplacementNamed('/home/');
          } else if (state is SplashStateNotLogged) {
            Modular.to.pushReplacementNamed('/login');
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Bem vindo, ao FinanceApp'),
              Text('seu dinheiro, na sua mão!'),
            ],
          ),
        ),
      ),
    );
  }
}
