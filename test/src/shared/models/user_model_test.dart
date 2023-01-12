import 'package:class_finance_app/src/shared/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/user_data_fixtures.dart';

void main() {
  group(
    'Testing UserModel',
    () {
      final fixtures = UserDataFixtures();
      test(
        'fromMap when all data provided',
        () {
          final map = fixtures.allData;

          final user = UserData.fromMap(map);

          expect(user.balance, equals(map['balance']));
          expect(user.userId, map['userId']);
          expect(user.userName, map['userName']);
          expect(user.docId, map['docId']);
          expect(user.categories, map['categories']);
        },
      );

      test(
        'fromMap when some data is not provided',
        () {
          final map = <String, dynamic>{};

          final user = UserData.fromMap(map);

          expect(user.balance, 0.0);
          expect(user.userId, '');
          expect(user.userName, '');
          expect(user.docId, '');
          expect(user.categories, []);
        },
      );
    },
  );
}
