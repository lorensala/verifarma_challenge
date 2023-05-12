import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/auth/auth.dart';
import 'package:movie_app/core/core.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.medium),
      child: GestureDetector(
        onTap: () => context
            .read<AuthBloc>()
            .add(const AuthEvent.logoutRequestedEvent()),
        child: SvgPicture.asset(
          Vectors.exit,
          height: 19,
          width: 19,
          semanticsLabel: 'logout',
          colorFilter: ColorFilter.mode(
            context.colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
