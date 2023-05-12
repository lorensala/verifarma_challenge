import 'package:flutter/material.dart';
import 'package:movie_app/core/core.dart';
import 'package:omdb/omdb.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.small),
        child: SizedBox(
          width: context.width * 0.5,
          child: Image.network(
            movie.poster,
            semanticLabel: movie.title,
            fit: BoxFit.fitWidth,
            errorBuilder: (context, _, __) {
              return const Center(
                child: Icon(Icons.image),
              );
            },
          ),
        ),
      ),
    );
  }
}
