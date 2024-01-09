import 'package:flutter/material.dart';
import 'package:witflex/config/constants/constante.dart';

AppBar appBarWidget({bool push = false }) {
    return AppBar(
      elevation: 0,
      backgroundColor: push ? colorBackgrundNegro : colorBackgrund,
      //title:  Text(usuarioSelect.usuario),
      
      
      leading: push
                ? null
                : Container(
        margin: const EdgeInsets.only(left: 10),
        child: const Image(image: AssetImage("assets/images/logo.png"), )
      ),
      
      actions: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Icon(Icons.cast)
        ),
        Container(
          padding: const EdgeInsets.only(right: 20, left: 15),
          child: const Icon(Icons.search)
        ),
        
      ],

      
    );
  }