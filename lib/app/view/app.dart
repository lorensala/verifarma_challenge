import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/auth/auth.dart';
import 'package:movie_app/counter/counter.dart';
import 'package:movie_app/l10n/l10n.dart';
import 'package:movie_app/movie/view/movie_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        authenticationRepository: GetIt.I.get<AuthenticationRepository>(),
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
              colorScheme: ColorScheme.fromSwatch(
                accentColor: const Color(0xFF13B9FF),
              ),
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) => state.when(
                authenticated: (_) => const CounterPage(),
                unauthenticated: MoviePage.new,
              ),
            ),
          );
        },
      ),
    );
  }
}
