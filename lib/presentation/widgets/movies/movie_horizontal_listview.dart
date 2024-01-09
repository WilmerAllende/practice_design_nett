import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:witflex/config/constants/constante.dart';
import 'package:witflex/domain/entities/entities.dart';

class MovieHorizontalListview extends StatelessWidget {
  final double heightLista;
  final double widthColumn;
  final List<Movie> movies;
  final String? title;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key,
    this.heightLista = 150,
    this.widthColumn = 100,
    required this.movies,
    this.title,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.symmetric(vertical: 15),
      height: heightLista + 50,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Text(title!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ))),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _SlideMovie(
                movie: movies[index],
                widthColumn: widthColumn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SlideMovie extends StatelessWidget {
  final Movie movie;
  final double widthColumn;
  const _SlideMovie({
    required this.movie,
    required this.widthColumn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthColumn,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.blue,
      child: GestureDetector(
        onTap: () {
          context.push("/movies/movie/${ movie.id }");
        },
        child: FadeInImage(
            //height: 220,
            fit: BoxFit.fill,
            placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
            image: NetworkImage(movie.posterPath)),
      ),
      //image: NetworkImage(movie.posterPath)
    );
  }
}
