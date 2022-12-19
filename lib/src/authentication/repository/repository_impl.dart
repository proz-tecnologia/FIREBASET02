import 'package:class_finance_app/src/authentication/repository/repository.dart';
import 'package:class_finance_app/src/shared/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepositoryImpl implements AuthRepository {
  FirebaseAuth get _auth => FirebaseAuth.instance;
  @override
  Future<void> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await Future.wait([
      _auth.currentUser!.updateDisplayName(name),
      _auth.currentUser!.sendEmailVerification(),
    ]);
  }

  @override
  User? getUser() => _auth.currentUser;

  @override
  Future<FirebaseApp> init() async {
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

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> recoveryPassword({
    required String user,
  }) async {
    return await _auth.sendPasswordResetEmail(email: user);
  }

  @override
  Future<void> createUserData({required UserData user}) async {
    await FirebaseFirestore.instance.collection('users').add(
          user.toMap(),
        );
  }
}
