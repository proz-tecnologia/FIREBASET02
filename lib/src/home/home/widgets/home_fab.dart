import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/models/transaction.dart';
import '../home_cubit.dart';

class HomeFab extends StatelessWidget {
  const HomeFab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      child: const Icon(Icons.add),
      distance: 54.0,
      children: [
        FloatingActionButton.small(
          heroTag: '1',
          onPressed: () async {
            await Modular.to.pushNamed(
              '/home/create',
              arguments: {
                'type': TransactionType.expense,
                'categories': Modular.get<HomeCubit>().userData!.categories,
              },
            );
            Modular.get<HomeCubit>().getUserData();
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.money_off_csred_sharp),
        ),
        FloatingActionButton.small(
          heroTag: '2',
          onPressed: () async {
            await Modular.to.pushNamed(
              '/home/create',
              arguments: {
                'type': TransactionType.received,
                'categories': Modular.get<HomeCubit>().userData!.categories,
              },
            );
            Modular.get<HomeCubit>().getUserData();
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.attach_money_sharp),
        ),
      ],
    );
  }
}
