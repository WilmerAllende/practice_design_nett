import 'package:flutter/material.dart';
import 'package:witflex/presentation/widgets/wdigets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            // Header
            const HeaderHomeScreen(),
            // texti
            Container(
              margin: const EdgeInsets.only(top: 87, bottom: 25),
              child: const Text(
                "¿Quién está viendo ahora?",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            const ListAvatarHeader(),
            // cuerpo
            // ListAvatarHeader(),
          ],
        ),
      ),
    );
  }
}