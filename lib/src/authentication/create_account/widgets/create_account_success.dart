import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SuccessCard extends StatelessWidget {
  const SuccessCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(height: 60.0),
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/190/190411.png',
            height: 64.0,
          ),
          const SizedBox(height: 32.0),
          const Text('Conta criada com sucesso!'),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              Modular.to.popUntil(
                ModalRoute.withName(
                  '/login',
                ),
              );
            },
            child: const Text('Ir para login'),
          ),
        ],
      ),
    );
  }
}
