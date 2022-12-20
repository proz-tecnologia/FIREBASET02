import 'package:class_finance_app/src/shared/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../shared/models/transaction.dart';

abstract class HomeRepository {
  Future<UserData> getUserData({required String userId});
  Future<List<FinancialTransaction>> getTransaction({required String userId});
  Future<void> createTransaction({required FinancialTransaction transaction});
  Future<void> updateBalance({required UserData userData});
}
