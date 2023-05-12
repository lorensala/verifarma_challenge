// ignore_for_file: public_member_api_docs

import 'package:authentication/authentication.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthenticationRepository {
  AuthenticationRepository({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  Option<User> get user => optionOf(_firebaseAuth.currentUser?.toModel());

  Stream<User?> get userStream =>
      _firebaseAuth.authStateChanges().map((user) => user?.toModel());

  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.unknown());
      }
    } catch (e) {
      return left(const AuthFailure.unknown());
    }
  }

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else if (e.code == 'invalid-email') {
        return left(const AuthFailure.invalidEmail());
      } else if (e.code == 'weak-password') {
        return left(const AuthFailure.weakPassword());
      } else {
        return left(const AuthFailure.unknown());
      }
    } catch (e) {
      return left(const AuthFailure.unknown());
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
