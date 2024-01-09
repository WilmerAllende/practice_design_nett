import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/entities.dart';

final usuarioSelectProvider =
    StateNotifierProvider<SelectUserNotifier, Avatar>((ref) {
  return SelectUserNotifier();
});

/*class SelectUserNotifier extends StateNotifier<Avatar> {
  final Avatar movieSelect;
  SelectUserNotifier({required this.movieSelect})
      : super(Avatar(usuario: "", imagen: ""));
}*/

class SelectUserNotifier extends StateNotifier<Avatar> {
  SelectUserNotifier() : super(Avatar(usuario: "", imagen: ""));

  void selectAvatar(Avatar avatar) {
    state = avatar;
  }
}
