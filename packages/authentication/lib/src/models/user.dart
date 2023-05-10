import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// {@template user}
/// User model
/// {@endtemplate}
@freezed
class User with _$User {
  /// {@macro user}
  const factory User({
    required String id,
    required String email,
    required String name,
    required String photoUrl,
  }) = _User;
}
