// ignore_for_file: public_member_api_docs

import 'package:authentication/src/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

extension UserX on firebase_auth.User {
  User toModel() {
    return User(
      id: uid,
      email: email ?? '',
      name: displayName ?? '',
      photoUrl: photoURL ?? '',
    );
  }
}
