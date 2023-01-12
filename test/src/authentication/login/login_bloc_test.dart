import 'package:bloc_test/bloc_test.dart';
import 'package:class_finance_app/src/authentication/login/login_bloc.dart';
import 'package:class_finance_app/src/authentication/login/login_state.dart';
import 'package:class_finance_app/src/authentication/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'login_mock.dart';

void main() {
  group('LoginBloc', () {
    AuthRepository repository = MockAuthRepository();

    LoginCubit cubit = LoginCubit(repository: repository);

    final mockUserCredential = MockUserCredential();
    tearDown(() {
      reset(repository);
      registerFallbackValue(MockUser());
    });

    blocTest('Login with success',
        build: () => cubit,
        setUp: () {
          when(
            () => repository.login(
              email: 'email',
              password: 'password',
            ),
          ).thenAnswer((_) async => mockUserCredential);
        },
        act: (bloc) async =>
            await bloc.login(email: 'email', password: 'password'),
        expect: () {
          expect(cubit.state, isA<LoginStateSuccess>());

          expect(
            (cubit.state as LoginStateSuccess).user,
            isA<MockUser>,
          );
        },
        verify: (bloc) {});
  });
}
