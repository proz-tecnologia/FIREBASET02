import 'package:firebase_auth/firebase_auth.dart';

abstract class SplashState {}

class SplashStateLoading extends SplashState {}

class SplashStateLogged extends SplashState {
  User user;
  SplashStateLogged({
    required this.user,
  });
}

class SplashStateNotLogged extends SplashState {}
