import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../shared/models/user.dart';

abstract class AuthRepository {
  Future<void> init();

  Future<void> createAccount({
    required String name,
    required String email,
    required String password,
  });

  Future<UserCredential> login({
    required String email,
    required String password,
  });

  Future<void> recoveryPassword({required String user});

  Future<void> createUserData({required AppUser user});

  User? getUser();
}
