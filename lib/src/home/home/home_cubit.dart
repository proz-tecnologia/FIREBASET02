import 'package:class_finance_app/src/home/repository/home_repository.dart';
import 'package:class_finance_app/src/shared/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;
  final String id;
  UserData? userData;

  HomeCubit({
    required this.repository,
    required this.id,
  }) : super(HomeStateEmpty());

  Future<void> getUserData([List<String>? categories]) async {
    try {
      emit(HomeStateLoading());

      userData = await repository.getUserData(userId: id);
      final transactions = await repository.getTransaction(id, categories);

      emit(
        HomeStateSuccess(
          user: userData!,
          transactions: transactions,
        ),
      );
    } catch (e, s) {
      emit(HomeStateError());
    }
  }
}
