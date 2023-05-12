import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/movie/movie.dart';
import 'package:movie_app/theme/theme.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state;
    return Padding(
      padding: const EdgeInsets.all(Sizes.medium),
      child: InkWell(
        onTap: () => context.read<ThemeCubit>().toggleTheme(),
        child: SvgPicture.asset(
          isDark ? Vectors.moon : Vectors.sun,
          semanticsLabel: isDark ? 'moon' : 'sun',
          colorFilter: ColorFilter.mode(
            context.colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
