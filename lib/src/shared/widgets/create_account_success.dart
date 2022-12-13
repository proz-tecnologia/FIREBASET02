import 'package:flutter/material.dart';

class CustomSuccessCard extends StatelessWidget {
  final String successMessage;
  final VoidCallback? onButtonPressed;
  const CustomSuccessCard({
    Key? key,
    required this.successMessage,
    this.onButtonPressed,
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
          Text(successMessage),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: onButtonPressed,
            child: const Text('Ir para login'),
          ),
        ],
      ),
    );
  }
}
