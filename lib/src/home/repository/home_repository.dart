import 'package:class_finance_app/src/shared/models/user.dart';

import '../../shared/models/transaction.dart';

abstract class HomeRepository {
  Future<UserData> getUserData({required String userId});
  Future<void> createTransaction({required FinancialTransaction transaction});
}
