import 'package:class_finance_app/src/authentication/recovery_password/recovery_password_state.dart';
import 'package:class_finance_app/src/authentication/repository/repository.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecoveryPasswordCubit extends Cubit<RecoveryPasswordState> {
  final AuthRepository repository;
  RecoveryPasswordCubit({
    required this.repository,
  }) : super(RecoveryStateEmpty());

  Future<void> recoveryPassword({required String email}) async {
    try {
      emit(RecoveryStateLoading());
      await repository.recoveryPassword(user: email);
      emit(RecoveryStateSuccess());
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      emit(RecoveryStateError());
    }
  }
}
