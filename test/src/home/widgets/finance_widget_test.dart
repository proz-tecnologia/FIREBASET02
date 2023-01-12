import 'package:class_finance_app/src/home/home/widgets/finance_widget.dart';
import 'package:class_finance_app/src/shared/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  testWidgets(
    'Testing FinanceWidget',
    (WidgetTester tester) async {
      late BuildContext generatedContext;
      final transaction = FinancialTransaction(
        type: TransactionType.received,
        value: 220.0,
        name: 'name',
        category: 'Vendas',
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                generatedContext = context;
                return Center(
                    child: FinanceOperationWidget(transaction: transaction));
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      final card = tester.widget<Card>(find.byType(Card));

      expect(card.color, Colors.white);

      expect(find.text(transaction.name), findsOneWidget);
      expect(
          find.text(
              DateFormat('dd/MM/yyyy').format(transaction.createdAt!.toDate())),
          findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Text &&
              widget.data == transaction.name &&
              widget.style == Theme.of(generatedContext).textTheme.headline6,
        ),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate((widget) =>
            widget is Text &&
            widget.data == transaction.category &&
            widget.style == Theme.of(generatedContext).textTheme.subtitle1),
        findsOneWidget,
      );
    },
  );
}
