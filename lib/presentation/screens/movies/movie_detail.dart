import 'package:flutter/material.dart';
import 'package:witflex/presentation/widgets/wdigets.dart';

class MovieDetail extends StatelessWidget {
  final String movieId;
  const MovieDetail({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarWidget(push: true),
      bottomNavigationBar: const CustomBottomNavigation(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // video
            const _VideoMovie(),
            // Datos cabecera
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Belleza Verdadera",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
      
            // Datos de episodios
            const _DatosEpisodioMovie(),
            const SizedBox(
              height: 10,
            ),
            const _DatosInfoTopMovie(),
            const SizedBox(
              height: 10,
            ),
            ButtonDetailExp(
              colorButton: Colors.white,
              icon: Icons.play_arrow,
              texto: "Ver",
              colorTextIcon: Colors.black,
              onSelected: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonDetailExp(
              colorButton: const Color.fromARGB(255, 43, 41, 41),
              icon: Icons.download,
              texto: "Descargar",
              colorTextIcon: Colors.white,
              onSelected: () {},
            ),
            const SizedBox(
              height: 10,
            ),
      
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Occaecat voluptate id elit sint. Ea nulla cupidatat in ipsum est minim velit nostrud. Enim laborum irure nulla nisi qui ad officia eu minim dolore minim ut ut. Voluptate fugiat ea anim fugiat dolore labore dolore pariatur occaecat in consectetur incididunt amet irure.",
                style: TextStyle(color: Colors.white),
              ),
            ),
      
            const SizedBox(
              height: 10,
            ),
      
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _IconDetailMovie( icon: Icons.add, texto: "Mi lista"),
                  _IconDetailMovie( icon: Icons.thumb_up_alt_outlined, texto: "Calificar"),
                  _IconDetailMovie( icon: Icons.share, texto: "Compartir"),
                  _IconDetailMovie( icon: Icons.download, texto: "Descargar"),
                ],
              ),
            ),
      
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class _IconDetailMovie extends StatelessWidget {
  final IconData icon;
  final String texto;
  const _IconDetailMovie({
    required this.icon, required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 27,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          texto,
          style: TextStyle(
            fontSize: 11,
            color: Colors.white.withOpacity(0.7),
          ),
        )
      ],
    );
  }
}

class _DatosInfoTopMovie extends StatelessWidget {
  const _DatosInfoTopMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.red,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Top",
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),
              Text(
                "10",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Text(
            "N.° 2 en TV hoy",
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
          ),
        )
      ],
    );
  }
}

class _DatosEpisodioMovie extends StatelessWidget {
  const _DatosEpisodioMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, top: 2, right: 5),
          child: Text(
            "2020",
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
          ),
        ),
        Container(
          color: Colors.grey.withOpacity(0.5),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          child: Text(
            "13+",
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Text(
            "16 episodios",
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
          ),
        )
      ],
    );
  }
}

class _VideoMovie extends StatelessWidget {
  const _VideoMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: size.width,
      height: size.height * 0.3,
      color: Colors.grey,
    );
  }
}
