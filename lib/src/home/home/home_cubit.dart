import 'package:class_finance_app/src/home/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;
  final String id;

  HomeCubit({
    required this.repository,
    required this.id,
  }) : super(HomeStateEmpty());

  Future<void> getUserData() async {
    try {
      emit(HomeStateLoading());

      final userData = await repository.getUserData(userId: id);

      emit(HomeStateSuccess(user: userData));
    } catch (e, s) {
      emit(HomeStateError());
    }
  }
}
