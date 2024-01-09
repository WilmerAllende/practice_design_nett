import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witflex/config/constants/constante.dart';

import '../wdigets.dart';

class PeliculaPrincipal extends StatelessWidget {
  const PeliculaPrincipal({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: size.height * 0.56,
      //width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(color: Colors.white.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              colorBackgrund,
              Colors.black,
            ]),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const SizedBox.expand(
              //fit: BoxFit.fill,
              //child: AssetImage("assets/images/samurai-x.jpg")
              child: Image(
                image: AssetImage("assets/images/samurai-x.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const CustomGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.4,
                  0.9
                ],
                colors: [
                  Colors.transparent,
                  colorBackgrund,
                ]),
          ),
          SizedBox(
            height: size.height * 0.54,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.play_arrow, color: Colors.black,), //icon data for elevated button
                  label: const Text("Reproducir", style: TextStyle(color: Colors.black),), //label text
                ),
                ElevatedButton.icon(
                  
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 25)
                  ),
                  icon: const Icon(Icons.add, color: Colors.white,), //icon data for elevated button
                  label: const Text("Mi lista", style: TextStyle(color: Colors.white),), //label text
                ),
              ],
            ),
          ),
          Positioned(
            //height: size.height * 0.5,
            bottom: size.height * 0.1,
            child:  Text("Crudo . Sombrio . De intriga . Pelicula", style: TextStyle(color: Colors.white.withOpacity(0.7)),),
          ),

          Positioned(
            //height: size.height * 0.5,
            bottom: size.height * 0.14,
            child:  Text("SAMURAI X", style: GoogleFonts.anton (
              textStyle: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900, letterSpacing: 3),)
            )
            ,
          ),

          Positioned(
            //height: size.height * 0.5,
            bottom: size.height * 0.2,
            child:  Text("Pelicula", style: GoogleFonts.anton (
              textStyle: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 15,  letterSpacing: 5),)
            )
            ,
          )

        ],
      ),
    );
  }
}


