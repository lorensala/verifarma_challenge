import 'package:flutter/material.dart';
import 'package:movie_app/core/core.dart';

class MovieDetailItem extends StatelessWidget {
  const MovieDetailItem({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    if (content.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: Sizes.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            semanticsLabel: title,
            style: context.textTheme.titleSmall!.copyWith(
              color: context.colorScheme.onBackground.withOpacity(0.7),
            ),
          ),
          Text(
            content,
            semanticsLabel: content,
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
