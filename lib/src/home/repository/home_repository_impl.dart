import 'package:class_finance_app/src/home/repository/home_repository.dart';
import 'package:class_finance_app/src/shared/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<UserData> getUserData({required String userId}) async {
    final response = await FirebaseFirestore.instance
        .collection('users')
        .where('userId', isEqualTo: userId)
        .get();

    final document = response.docs[0].data();

    final userData = UserData.fromMap(document);

    return userData;
  }
}
