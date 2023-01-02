import 'package:class_finance_app/src/home/repository/home_repository.dart';
import 'package:class_finance_app/src/shared/models/transaction.dart';
import 'package:class_finance_app/src/shared/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepositoryImpl implements HomeRepository {
  CollectionReference get _users =>
      FirebaseFirestore.instance.collection('users');
  CollectionReference get _transaction =>
      FirebaseFirestore.instance.collection('transaction');

  @override
  Future<UserData> getUserData({
    required String userId,
  }) async {
    final response = await _users.where('userId', isEqualTo: userId).get();

    final document = response.docs.first.data() as Map<String, dynamic>;

    final userData = UserData.fromMap(document);

    return userData;
  }

  @override
  Future<void> createTransaction({
    required FinancialTransaction transaction,
  }) async {
    final response = await _transaction.add(transaction.toMap());

    await _transaction.doc(response.id).update(
      {
        'id': response.id,
      },
    );
  }

  @override
  Future<void> updateBalance({
    required UserData userData,
  }) async =>
      await _users.doc(userData.docId).update({
        'balance': userData.balance,
      });

  @override
  Future<List<FinancialTransaction>> getTransaction(
    String userId, [
    List<String>? categories,
    DateTime? initialDate,
    DateTime? endDate,
  ]) async {
    var chamada = _transaction.where('userId', isEqualTo: userId);

    if (categories?.isNotEmpty ?? false) {
      chamada = chamada.where('category', whereIn: categories);
    }
    if (initialDate != null) {
      chamada = chamada.where('createdAt',
          isGreaterThan: Timestamp.fromDate(DateTime(2022, 12, 21, 0, 0)));
    }
    if (endDate != null) {
      chamada = chamada.where('createdAt',
          isLessThan: Timestamp.fromDate(DateTime(2022, 12, 21, 0, 0)));
    }

    final firebaseTransaction =
        await chamada.orderBy('createdAt', descending: true).get();

    final transaction = firebaseTransaction.docs
        .map(
          (e) => FinancialTransaction.fromMap(
            Map<String, dynamic>.from(
              e.data() as Map<String, dynamic>,
            ),
          ),
        )
        .toList();

    return transaction;
  }

  @override
  Future<void> createCategory({
    required String category,
    required String docId,
  }) async {
    await _users.doc(docId).update({
      'categories': FieldValue.arrayUnion([category]),
      'userName': 'Alencar Moreira'
    });
  }
}
