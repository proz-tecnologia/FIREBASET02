abstract class CreateTransactionState {
  const CreateTransactionState();
}

class CreateTransactionStateEmpty extends CreateTransactionState {}

class CreateTransactionStateLoading extends CreateTransactionState {}

class CreateTransactionStateSuccess extends CreateTransactionState {}

class CreateCategorySuccess extends CreateTransactionState {}

class CreateTransactionStateError extends CreateTransactionState {
  final Exception exception;

  const CreateTransactionStateError({required this.exception});
}
