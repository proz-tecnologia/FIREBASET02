import 'package:class_finance_app/src/shared/models/user.dart';

import '../../shared/models/transaction.dart';

abstract class HomeState {}

class HomeStateEmpty extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  final UserData user;
  final List<FinancialTransaction> transactions;

  HomeStateSuccess({
    required this.user,
    required this.transactions,
  });
}

class HomeStateError extends HomeState {}
