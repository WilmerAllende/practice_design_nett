import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:witflex/presentation/providers/providers.dart';

class CustomBottomNavigation extends ConsumerWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userSelect = ref.watch(usuarioSelectProvider);
    return BottomNavigationBar(
      //backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,

      unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
      backgroundColor: Colors.black,
      fixedColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.5),
      //showUnselectedLabels: true,
      unselectedFontSize: 2,
      items: [
        const BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: FaIcon(FontAwesomeIcons.house, )),
            label: "Inicio"),
        const BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: FaIcon(
              FontAwesomeIcons.gamepad
            ),
          ),
          label: "Juegos",
        ),
        const BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Icon( Icons.add_box_outlined,  )),
            label: "Nuevo"
        ),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image(
                image: AssetImage(userSelect.imagen),
                height: 30,
                width: 30,
              ),
            ),
            label: "Mi Netflix"),
      ],
    );
  }
}
