import 'package:class_finance_app/src/home/create/create_transaction_state.dart';
import 'package:class_finance_app/src/home/repository/home_repository.dart';
import 'package:class_finance_app/src/shared/models/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTransactionCubit extends Cubit<CreateTransactionState> {
  final HomeRepository _repository;

  CreateTransactionCubit(this._repository)
      : super(CreateTransactionStateEmpty());

  Future<void> createTransaction({required FinancialTransaction transaction}) async {
    try {
      emit(CreateTransactionStateLoading());

      await _repository.createTransaction(transaction: transaction);

      emit(CreateTransactionStateSuccess());
    } catch (e) {
      emit(CreateTransactionStateError(exception: e as Exception));
    }
  }
}
