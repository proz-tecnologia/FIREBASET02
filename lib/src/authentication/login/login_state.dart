import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {}

class LoginStateEmpty extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  User user;
  LoginStateSuccess({
    required this.user,
  });
}

class LoginStateError extends LoginState {}
