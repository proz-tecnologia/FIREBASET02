import 'package:class_finance_app/src/shared/models/transaction.dart';
import 'package:class_finance_app/src/shared/models/user.dart';
import 'package:faker/faker.dart';

class HomeCubitFixture {
  UserData userData = UserData(
    userId: '1234',
    userName: 'userName',
    balance: 3680.0,
    docId: faker.randomGenerator.string(50),
  );

  List<FinancialTransaction> transactions = [
    FinancialTransaction(
      type: TransactionType.received,
      value: 220.0,
      name: 'name',
      category: 'Vendas',
      id: '12',
    ),
    FinancialTransaction(
      type: TransactionType.received,
      value: 221.0,
      name: 'name',
      category: 'Vendas',
      id: '31',
    ),
    FinancialTransaction(
      type: TransactionType.received,
      value: 222.0,
      name: 'name',
      category: 'Vendas',
    ),
  ];
}
