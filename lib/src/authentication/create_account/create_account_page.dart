import 'package:class_finance_app/src/authentication/create_account/create_account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'create_account_state.dart';
import 'widgets/create_account_error.dart';
import 'widgets/create_account_success.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final nameController = TextEditingController();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final cubit = Modular.get<CreateAccountCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<CreateAccountCubit, CreateAccountState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is CreateAccountStateLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is CreateAccountStateError) {
            Navigator.of(context, rootNavigator: true).pop();
            showModalBottomSheet(
              context: context,
              builder: (context) => const ErrorCard(),
            );
          } else if (state is CreateAccountStateSuccess) {
            Navigator.of(context, rootNavigator: true).pop();
            showModalBottomSheet(
              context: context,
              builder: (context) => const SuccessCard(),
            );
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            const SizedBox(height: 56.0),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Nome'),
            ),
            const SizedBox(height: 8.0),
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
                cubit.createAccount(
                  email: userController.text,
                  name: nameController.text,
                  password: passwordController.text,
                );
              },
              child: const Text('Criar conta'),
            ),
          ],
        ),
      ),
    );
  }
}
