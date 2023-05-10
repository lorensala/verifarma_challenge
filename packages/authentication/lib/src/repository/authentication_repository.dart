// ignore_for_file: public_member_api_docs

import 'package:authentication/src/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  AuthenticationRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  Option<User> get user => optionOf(_firebaseAuth.currentUser);

  Stream<User?> get userStream => _firebaseAuth.authStateChanges();

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
    } on FirebaseAuthException catch (e) {
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
    } on FirebaseAuthException catch (e) {
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
}
