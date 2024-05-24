import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:summit_rock/src/features/word_decoder/application/result_service.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

part 'result_page_controller.g.dart';

@riverpod
class ResultPageController extends _$ResultPageController {
  Future<Result?> _fetch(ResultId resultId) async {
    return await ref.watch(resultProvider(resultId).future);
  }

  @override
  FutureOr<Result?> build(ResultId resultId) async {
    return _fetch(resultId);
  }

  Future<void> toggleFavorite(String word) async {
    final Result? result = state.value;
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
      return _fetch(copy.id);
    });
    ref.invalidateSelf();

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

  bool isFavorite(String word) {
    return state.value?.favorites.contains(word) ?? false;
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
