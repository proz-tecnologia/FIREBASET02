import 'package:class_finance_app/src/shared/models/user.dart';

import '../../shared/models/transaction.dart';

abstract class HomeRepository {
  Future<UserData> getUserData({required String userId});
  Future<List<FinancialTransaction>> getTransaction(String userId,
      [List<String>? categories]);
  Future<void> createTransaction({required FinancialTransaction transaction});
  Future<void> updateBalance({required UserData userData});
  Future<void> createCategory({
    required String category,
    required String docId,
  });
}
