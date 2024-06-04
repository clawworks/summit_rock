import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'results_list_controller.g.dart';

@riverpod
bool listContainsFavorite(
  ListContainsFavoriteRef ref,
  List<String> words,
  List<String> favorites,
) {
  for (String fav in favorites) {
    if (words.contains(fav)) {
      return true;
    }
  }
  return false;
}
