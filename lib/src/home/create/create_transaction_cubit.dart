import 'package:class_finance_app/src/home/create/create_transaction_state.dart';
import 'package:class_finance_app/src/home/home/home_cubit.dart';
import 'package:class_finance_app/src/home/repository/home_repository.dart';
import 'package:class_finance_app/src/shared/models/transaction.dart';
import 'package:class_finance_app/src/shared/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateTransactionCubit extends Cubit<CreateTransactionState> {
  final HomeRepository _repository;
  final String _userId;
  final UserData userData;

  CreateTransactionCubit(
    this._repository,
    this._userId,
    this.userData,
  ) : super(CreateTransactionStateEmpty());

  Future<void> createTransaction({
    required FinancialTransaction transaction,
  }) async {
    try {
      emit(CreateTransactionStateLoading());

      UserData? myUserData;

      final updatedTransaction = transaction.copyWith(userId: _userId);

      await _repository.createTransaction(transaction: updatedTransaction);
      if (transaction.type == TransactionType.expense) {
        myUserData = userData.copyWith(
          balance: userData.balance - transaction.value,
        );
      } else {
        myUserData = userData.copyWith(
          balance: userData.balance + transaction.value,
        );
      }

      Modular.get<HomeCubit>().userData = myUserData;
      await _repository.updateBalance(userData: myUserData);

      emit(CreateTransactionStateSuccess());
    } catch (e) {
      emit(CreateTransactionStateError(exception: e as Exception));
    }
  }
}
