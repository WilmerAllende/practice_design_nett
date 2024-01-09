
import 'package:flutter/material.dart';
import 'package:witflex/config/constants/constante.dart';

class ChipCategories extends StatelessWidget {
  final String valor;
  final bool iconSpan;
  final IconData icon;
  const ChipCategories({
    super.key,
    required this.valor,
    this.iconSpan = false,  this.icon = Icons.expand_more,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        elevation: 0,
        padding: const EdgeInsets.all(4),
        backgroundColor: colorBackgrund,
        
        shape: const StadiumBorder(side: BorderSide(color: Colors.white, strokeAlign: 20)),
        label: Text(
          valor,
          style: const TextStyle(color: Colors.white),
        ),
        avatar: iconSpan
            ? InkWell(
                onTap: () {},
                child: Icon(
                  icon,
                  size: 25,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
