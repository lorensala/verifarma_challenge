import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/movie_detail/movie_detail.dart';
import 'package:omdb/omdb.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.small),
        child: SizedBox(
          width: Sizes.large * 2,
          child: Image.network(
            movie.poster,
            fit: BoxFit.fitWidth,
            errorBuilder: (context, _, __) {
              return const Center(
                child: Icon(Icons.image),
              );
            },
          ),
        ),
      ),
      trailing: SvgPicture.asset(
        Vectors.chevronRight,
        semanticsLabel: 'arrow right',
        colorFilter: ColorFilter.mode(
          context.colorScheme.onBackground.withOpacity(0.5),
          BlendMode.srcIn,
        ),
      ),
      title: Text(movie.title),
      subtitle: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: movie.type.capizalize,
              semanticsLabel: movie.type.capizalize,
              style: TextStyle(
                color: context.colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
            const TextSpan(text: ' • '),
            TextSpan(
              text: movie.year,
              semanticsLabel: movie.year,
              style: TextStyle(
                color: context.colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
          ],
        ),
        style: TextStyle(
          color: context.colorScheme.onBackground.withOpacity(0.5),
        ),
      ),
      onTap: () => Navigator.of(context)
          .push(MovieDetailPage.route(movieId: movie.imdbId)),
    );
  }
}
