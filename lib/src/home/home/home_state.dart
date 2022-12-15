import 'package:class_finance_app/src/shared/models/user.dart';

abstract class HomeState {}

class HomeStateEmpty extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  final UserData user;

  HomeStateSuccess({
    required this.user,
  });
}

class HomeStateError extends HomeState {}
