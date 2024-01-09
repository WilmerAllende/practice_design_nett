import 'package:flutter/material.dart';

class ButtonDetailExp extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color colorButton;
  final Color colorTextIcon;
  final Function()? onSelected;

  const ButtonDetailExp({
    super.key,
    required this.icon,
    required this.texto,
    required this.colorButton,
    this.onSelected, required this.colorTextIcon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      //alignment: Alignment.center,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),

      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: const RoundedRectangleBorder(),
        ),

        icon: Icon(
          icon,
          color: colorTextIcon,
        ), //icon data for elevated button
        label: Text(
          texto,
          style: TextStyle(
              color: colorTextIcon, fontWeight: FontWeight.bold, fontSize: 15),
        ), //label text
      ),
    );
  }
}
