import 'package:class_finance_app/src/shared/models/user.dart';
import 'package:equatable/equatable.dart';

import '../../shared/models/transaction.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeStateEmpty extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  final UserData user;
  final List<FinancialTransaction> transactions;

  HomeStateSuccess({
    required this.user,
    required this.transactions,
  });

  @override
  List<Object?> get props => [
        user,
        transactions,
      ];
}

class HomeStateError extends HomeState {}
