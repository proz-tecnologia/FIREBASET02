import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../home_cubit.dart';

class HomeEmptyStateWidget extends StatelessWidget {
  const HomeEmptyStateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Voce ainda não tem transações'),
          TextButton(
            onPressed: () => context.read<HomeCubit>().getUserData(),
            child: const Text('Limpar filtros'),
          ),
        ],
      ),
    );
  }
}
