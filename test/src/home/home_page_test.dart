import 'package:class_finance_app/src/app_module.dart';
import 'package:class_finance_app/src/home/home/home_page.dart';
import 'package:class_finance_app/src/home/home/widgets/home_fab.dart';
import 'package:class_finance_app/src/home/home/widgets/home_state_success.dart';
import 'package:class_finance_app/src/home/home_module.dart';
import 'package:class_finance_app/src/home/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

import 'home_cubit.mock.dart';
import 'home_cubit_fixture.dart';

void main() {
  group(
    'Home Page',
    () {
      const userId = '1234';
      final resultMocks = HomeCubitFixture();
      final repository = HomeRepositoryMock();

      setUp(() {
        initModules([
          AppModule(),
          HomeModule(),
        ], replaceBinds: [
          Bind.instance<HomeRepository>(
            repository,
          ),
        ]);

        when(
          () => repository.getUserData(userId: userId),
        ).thenAnswer(
          (_) => Future.value(resultMocks.userData),
        );
        when(
          () => repository.getTransaction(userId),
        ).thenAnswer(
          (_) => Future.value(resultMocks.transactions),
        );
      });

      testWidgets(
        'when loading',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: HomePage(),
            ),
          );

          await tester.pump();

          // final fabButton =
          //     await tester.widget(find.byType(FloatingActionButton));

          expect(find.byType(HomeFab), findsOneWidget);
          expect(find.byType(CircularProgressIndicator), findsNothing);
          expect(find.byType(HomeStateSuccessWidget), findsNothing);

          await tester.pumpAndSettle(const Duration(seconds: 2));
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        },
      );
    },
  );
}
