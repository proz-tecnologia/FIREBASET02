import 'package:class_finance_app/src/authentication/login/login_bloc.dart';
import 'package:class_finance_app/src/shared/widgets/create_account_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  final cubit = Modular.get<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is LoginStateLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LoginStateError) {
          Navigator.pop(context);
          showModalBottomSheet(
            context: context,
            builder: (context) => const CustomErrorCard(
              errorMessage: 'Erro ao logar, tente novamente!',
            ),
          );
        } else if (state is LoginStateSuccess) {
          Navigator.pop(context);
          //TODO: create home and navigate
        }
      },
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            TextFormField(
              controller: userController,
              decoration: const InputDecoration(hintText: 'E-mail'),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Senha'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                cubit.login(
                  email: userController.text,
                  password: passwordController.text,
                );
              },
              child: const Text(
                'login',
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/createAccount');
              },
              child: const Text(
                'Criar conta',
              ),
            ),
            const SizedBox(height: 8.0),
            TextButton(
              onPressed: () => Modular.to.pushNamed('/recoveryPassword'),
              child: const Text('Recuperar senha'),
            ),
          ],
        ),
      ),
    );
  }
}
