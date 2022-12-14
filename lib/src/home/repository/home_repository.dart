import 'package:class_finance_app/src/shared/models/user.dart';

abstract class HomeRepository {
  Future<UserData> getUserData({required String userId});
}
