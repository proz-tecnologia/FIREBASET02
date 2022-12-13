import 'package:class_finance_app/src/authentication/splash/splash_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/repository.dart';

class SplashBloc extends Cubit<SplashState> {
  final AuthRepository repository;
  SplashBloc({required this.repository}) : super(SplashStateLoading());

  Future<void> setup() async {
    await initializeFirebase();
    hasUser();
  }

  Future<FirebaseApp> initializeFirebase() async {
    return await Firebase.initializeApp(
      name: 'finance-app',
      options: const FirebaseOptions(
        apiKey: "AIzaSyBFTq6dCJNEG02U0eeAVOR-IDKqSbw1WyU",
        appId: "1:193053702444:android:a266889a3c45b84af99489",
        messagingSenderId: "193053702444",
        projectId: "finance-app-2e2bd",
      ),
    );
  }

  void hasUser() {
    final user = repository.getUser();

    if (user != null) {
      emit(SplashStateLogged());
    } else {
      emit(SplashStateNotLogged());
    }
  }
}
