import 'dart:developer';

import 'package:class_finance_app/src/authentication/repository/repository.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repository;

  LoginCubit({required this.repository}) : super(LoginStateEmpty());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginStateLoading());
      final user = await repository.login(email: email, password: password);
      log(user.toString());
      emit(LoginStateSuccess());
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      emit(LoginStateError());
    }
  }
}
