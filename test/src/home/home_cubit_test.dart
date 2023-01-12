import 'package:bloc_test/bloc_test.dart';
import 'package:class_finance_app/src/home/home/home_cubit.dart';
import 'package:class_finance_app/src/home/home/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'home_cubit.mock.dart';
import 'home_cubit_fixture.dart';

void main() {
  final repository = HomeRepositoryMock();
  group(
    'Test HomeCubit',
    () {
      const userId = '1234';
      final resultMocks = HomeCubitFixture();
      final bloc = HomeCubit(
        repository: repository,
        id: userId,
      );
      blocTest(
        'Test HomeCubit when success',
        build: () => bloc,
        setUp: () {
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
        },
        act: (bloc) async {
          await bloc.getUserData();
        },
        expect: () => [
          HomeStateLoading(),
          HomeStateSuccess(
            user: resultMocks.userData,
            transactions: resultMocks.transactions,
          ),
        ],
      );

      blocTest(
        'Test HomeCubit when throw an error',
        build: () => bloc,
        setUp: () {
          when(
            () => repository.getUserData(userId: userId),
          ).thenThrow(
            (_) => Exception('Erro desconhecido'),
          );
        },
        act: (bloc) async {
          await bloc.getUserData();
        },
        expect: () => [
          HomeStateLoading(),
          HomeStateError(),
        ],
      );
    },
  );
}
