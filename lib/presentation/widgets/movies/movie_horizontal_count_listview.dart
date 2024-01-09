import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witflex/config/constants/constante.dart';
import 'package:witflex/domain/entities/entities.dart';

class MovieHorizontalCountListview extends StatelessWidget {
  final double heightLista;
  final double widthColumn;

  final List<Movie> movies;
  final String? title;
  final VoidCallback? loadNextPage;

  const MovieHorizontalCountListview({
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
      height: heightLista,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if ( title != null )
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Text(title!, style: const TextStyle(color: Colors.white, fontSize: 16,  ) )),

          Expanded(
            child: ListView.builder(
              itemCount: movies.length > 10 ? 10 : movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _SlideMovie(
                movie: movies[index],
                widthColumn: widthColumn,
                numero: index+1,
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
  final int numero;
  const _SlideMovie({
    required this.movie,
    required this.widthColumn, 
    required this.numero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthColumn,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.bottomRight,
        
        children: [
          Positioned(
            bottom: -20,
            
            left: widthColumn * 0.04,

            //child: const Text("1", style: TextStyle(color: Colors.white, fontSize: 50),), rubikBurned
            child: Text(
              numero.toString(),
              style: GoogleFonts.rubikMoonrocks(
                textStyle: const TextStyle(color: Colors.white, fontSize: 85),
              ),
            ),
          ),
          FadeInImage(
              //height: 220,
              height: double.infinity,
              width: widthColumn * 0.65,
              fit: BoxFit.fill,
              placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
              image: NetworkImage(movie.posterPath)),
          
        ],
      ),
      //image: NetworkImage(movie.posterPath)
    );
  }
}
