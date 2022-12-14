import 'package:class_finance_app/src/authentication/repository/repository.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/models/user.dart';
import 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final AuthRepository repository;

  CreateAccountCubit({
    required this.repository,
  }) : super(CreateAccountInitial());

  Future<void> createAccount({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      emit(CreateAccountStateLoading());

      await repository.createAccount(
        name: name,
        email: email,
        password: password,
      );

      await repository.createUserData(
        user: AppUser(
          userName: name,
          userId: repository.getUser()!.uid,
        ),
      );

      emit(CreateAccountStateSuccess());
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      emit(CreateAccountStateError());
    }
  }
}
