import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:witflex/config/constants/constante.dart';
import 'package:witflex/domain/entities/avatar.dart';

import '../providers/providers.dart';

class ListAvatarHeader extends ConsumerWidget {
  const ListAvatarHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final avatarSelect = ref.watch(usuarioSelectProvider);
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 25,
          // childAspectRatio: 1,
          //crossAxisSpacing: 0.1,
        ),
        itemCount: avatars.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              //ref.read(usuarioSelectProvider.notifier).update((state) => avatars[index]);
              ref.read(usuarioSelectProvider.notifier).selectAvatar(avatars[index]) ;
              context.go("/movies");
              //print(avatars[index].usuario);
            },
            child: _AvatarStyle(avatars[index])),
      ),
    );
  }
}

class _AvatarStyle extends StatelessWidget {
  final Avatar avatar;
  const _AvatarStyle(this.avatar);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          //margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 95,
          width: 100,
          // color: Colors.red,
          child: FadeInImage(
              placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
              image: AssetImage(avatar.imagen)),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          avatar.usuario,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        // SizedBox( height: 5,),
      ],
    );
  }
}
