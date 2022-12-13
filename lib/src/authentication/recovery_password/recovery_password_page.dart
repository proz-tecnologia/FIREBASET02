import 'package:class_finance_app/src/authentication/recovery_password/recovery_password_cubit.dart';
import 'package:class_finance_app/src/shared/widgets/create_account_success.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/widgets/create_account_error.dart';
import 'recovery_password_state.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({super.key});

  @override
  State<RecoveryPasswordPage> createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  final userController = TextEditingController();
  final cubit = Modular.get<RecoveryPasswordCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar senha'),
      ),
      body: BlocListener<RecoveryPasswordCubit, RecoveryPasswordState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is RecoveryStateLoading) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is RecoveryStateError) {
            Navigator.pop(context);
            showModalBottomSheet(
              context: context,
              builder: (context) => const CustomErrorCard(
                errorMessage:
                    'Erro ao recuperar senha, verifique se o e-mail foi digitado corretamente!',
              ),
            );
          } else if (state is RecoveryStateSuccess) {
            Navigator.pop(context);
            showModalBottomSheet(
              context: context,
              builder: (context) => CustomSuccessCard(
                successMessage:
                    'Você receberá um e-mail para alteração, verifique o e-mail cadastrado!',
                onButtonPressed: () {
                  Modular.to.popUntil(
                    ModalRoute.withName(
                      '/login',
                    ),
                  );
                },
              ),
            );
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            TextFormField(
              controller: userController,
              decoration: const InputDecoration(hintText: 'E-mail'),
            ),
            ElevatedButton(
              onPressed: () {
                cubit.recoveryPassword(
                  email: userController.text,
                );
              },
              child: const Text(
                'Recuperar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
