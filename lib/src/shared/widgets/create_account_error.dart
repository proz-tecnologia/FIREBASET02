import 'package:flutter/material.dart';

class CustomErrorCard extends StatelessWidget {
  final String errorMessage;
  const CustomErrorCard({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(height: 60.0),
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/753/753345.png',
            height: 64.0,
          ),
          const SizedBox(height: 32.0),
          Text(errorMessage),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }
}
