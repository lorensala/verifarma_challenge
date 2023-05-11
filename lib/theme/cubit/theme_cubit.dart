// ignore_for_file: avoid_positional_boolean_parameters

import 'package:hydrated_bloc/hydrated_bloc.dart';

/// {@template theme_cubit}
/// An [HydratedCubit] which manages and stores the current theme state.
/// {@endtemplate}
class ThemeCubit extends HydratedCubit<bool> {
  ThemeCubit([super.value = true]);

  void toggleTheme() => emit(!state);

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json['isDark'] as bool?;
  }

  @override
  Map<String, dynamic>? toJson(bool? state) {
    return {'isDark': state};
  }
}
