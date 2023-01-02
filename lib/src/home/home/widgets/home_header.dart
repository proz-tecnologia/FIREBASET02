import 'package:flutter/material.dart';

import '../../../shared/utils/formatter.dart';
import 'home_state_success.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomeStateSuccessWidget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade800,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá, seja bem vindo ${widget.state.user.userName}',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const Text(
              '    Seu saldo é',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Center(
              child: Text(
                Formatters.formatToReal(widget.state.user.balance),
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
