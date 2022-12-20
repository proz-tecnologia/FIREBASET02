import 'package:firebase_auth/firebase_auth.dart';

class AppController {
  User? _user;

  User? get user => _user;

  void setUser(User newUser) => _user = newUser;

  void logOut() => _user = null;
}
