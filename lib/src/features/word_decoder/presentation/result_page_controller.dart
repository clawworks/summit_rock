import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:summit_rock/src/features/results/application/result_service.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

part 'result_page_controller.g.dart';

@riverpod
Future<bool> isWordFavorite(
    IsWordFavoriteRef ref, ResultId resultId, String word) async {
  return ref
          .watch(resultStreamProvider(resultId))
          .value
          ?.favorites
          .contains(word) ??
      false;
}

@riverpod
class ResultPageController extends _$ResultPageController {
  // Future<Result?> _fetch(ResultId resultId) async {
  //   return await ref.watch(resultProvider(resultId).future);
  // }

  @override
  FutureOr<void> build(ResultId resultId) async {
    // return _fetch(resultId);
  }

  Future<void> toggleFavorite(String word) async {
    final Result? result = await ref.read(resultProvider(resultId).future);
    if (result == null) return;
    List<String> updatedFavs = [];
    if (result.favorites.contains(word)) {
      // Remove the word from favorites
      updatedFavs = [
        for (String w in result.favorites)
          if (w != word) w,
      ];
    } else {
      // Add the word to favorites
      updatedFavs = [...result.favorites, word];
    }
    state = await AsyncValue.guard(() async {
      Result copy = result.copyWith(favorites: updatedFavs);
      await ref.read(resultServiceProvider).setResult(copy);
      // return _fetch(copy.id);
    });

    //   for (final fav in state.value?.favorites ?? [])
    //     if (fav == word)
    //   // Mark only the matching word as favorite
    //   // Make a copy since the state is immutable.
    //   // TODO save in favorites
    //   // fav.copyWith(favorite: !fav.favorite)
    //   else
    //   // Other words are not modified
    //   fav,
    // ];
    // state = await AsyncValue.guard(() {
    //
    //     // state.value.copyWith(
    //   // favorites: [...state.value.favorites, ]
    // );
    // });
  }
}

//
// final pResultPageController = NotifierProvider.autoDispose<ResultPageController, Result>(() {
//   return ResultPageController();
// });
//
// class ResultPageController extends Notifier<Result> {
//   @override
//   Result build() {
//     return ;
//   }
// }
