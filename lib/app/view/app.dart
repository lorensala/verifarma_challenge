import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/auth/auth.dart';
import 'package:movie_app/l10n/l10n.dart';
import 'package:movie_app/login/view/login_page.dart';
import 'package:movie_app/movie/view/movie_page.dart';
import 'package:movie_app/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            authenticationRepository: GetIt.I.get<AuthenticationRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final isDark = context.watch<ThemeCubit>().state;
          final user = context.watch<AuthBloc>().state;

          return MaterialApp(
            theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: user.when(
              authenticated: (_) => const MoviePage(),
              unauthenticated: () => const LoginPage(),
            ),
          );
        },
      ),
    );
  }
}
