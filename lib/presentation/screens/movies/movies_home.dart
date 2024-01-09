import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:witflex/config/constants/constante.dart';
import 'package:witflex/presentation/widgets/wdigets.dart';

import '../../providers/providers.dart';

class MoviesHome extends ConsumerStatefulWidget {
  const MoviesHome({super.key});

  @override
  MoviesHomeState createState() => MoviesHomeState();
}

class MoviesHomeState extends ConsumerState<MoviesHome> {

  @override
  void initState() {
    super.initState();
    
    ref.read( nowPlayingMovieProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if ( initialLoading ) return  Container();

    final popularMovies = ref.watch( popularMoviesProvider );
    final nowPlayingMovies = ref.watch( nowPlayingMovieProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );
    final upcomingMovies = ref.watch( upcomingMoviesProvider );

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarWidget(),
      bottomNavigationBar: const CustomBottomNavigation(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              //color: Colors.red,
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            //stops:  [0.4, 0.6, 0.8],
            //stops:  [0.6, 1.0],
            colors: [
              colorBackgrund,
              Colors.black,
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              const SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    ChipCategories(valor: "Series"),
                    ChipCategories(valor: "Películas"),
                    ChipCategories(valor: "Categorias", iconSpan: true,),
                  ],
                ),
              ),
      
              // Imagen grande
              PeliculaPrincipal(size: size),
      
              // Agregadso recientemente
              /*const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Text("Agregados recientemente", style: TextStyle(color: Colors.white, fontSize: 16,  ) )),
              */
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: "Agregados recientemente",
                heightLista: 150,
                widthColumn: 100,
              ),

              // Agregadso recientemente
              
              MovieHorizontalListview(
                movies: upcomingMovies,
                title: "Solo en Netflix",
                heightLista: 250,
                widthColumn: 150,
              ),

              
              MovieHorizontalCountListview(
                movies: popularMovies,
                title: "Las 10 peliculas mas populares",
                heightLista: 230,
                widthColumn: 160,
              ),


              MovieHorizontalListview(
                movies: topRatedMovies,
                title: "Los mas vistos",
                heightLista: 150,
                widthColumn: 100,
              ),

              /*
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Text("Otros", style: TextStyle(color: Colors.white, fontSize: 16,  ) )),
                */


      
            ],
          ),
        ),
      ),
    );
  }
}


