import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderHomeScreen extends StatelessWidget {
  const HeaderHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Spacer(),
        /*Text("WILFLEX",  style: GoogleFonts.lato(
          
            textStyle: const TextStyle( color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold, )
          ),  
        ),*/
        Text(
          'NETFLIX',
          style: GoogleFonts.anton(
            textStyle: const TextStyle( color: Color.fromARGB(255, 250, 21, 4), fontSize: 28 , letterSpacing: 2 ),
          ),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.create_outlined,
            color: Colors.white,
            size: 28,
          ),
        )
      ],
    );
  }
}
