import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/models/transaction.dart';

class FinanceOperationWidget extends StatelessWidget {
  final FinancialTransaction transaction;

  const FinanceOperationWidget({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  String get textType =>
      transaction.type == TransactionType.expense ? 'Despesa' : 'Receita';

  Color get color =>
      transaction.type == TransactionType.expense ? Colors.red : Colors.green;

  String get value =>
      'R\$ ${transaction.value.toStringAsFixed(2).replaceFirst('.', ',')}';

  String get formattedDate =>
      DateFormat('dd/MM/yyyy').format(transaction.createdAt!.toDate());

  String get formattedTime =>
      DateFormat('h:mm a').format(transaction.createdAt!.toDate());

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 16.0,
                      width: 16.0,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(textType),
                  ],
                ),
                Column(
                  children: [
                    Text(formattedDate),
                    Text(formattedTime),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Divider(),
            const SizedBox(height: 8.0),
            Text(
              transaction.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8.0),
            Text(
              transaction.category,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
