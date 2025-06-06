import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:summit_rock/src/features/authentication/data/auth_repository.dart';
import 'package:summit_rock/src/features/settings/domain/summit_rock_year.dart';
import 'package:summit_rock/src/features/settings/presentation/settings_controller.dart';
import 'package:summit_rock/src/features/word_decoder/data/results_repository.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

part 'result_service.g.dart';

@riverpod
String resultTitle(Ref ref, Result result) {
  List<String> combined = ref.watch(combinedListProvider(
      numbers: result.numbers, letterMap: result.letterMap));
  String title = '';
  for (var letter in combined) {
    title += '$letter, ';
  }
  title = title.substring(0, title.length - 2);
  return title;
}

@riverpod
List<String> combinedList(
  Ref ref, {
  required List<int> numbers,
  required Map<int, String> letterMap,
}) {
  List<String> numberStrings = numbers.map((e) => e.toString()).toList();
  List<int> keys = letterMap.keys.toList();
  keys.sort();
  for (final key in keys) {
    final String? value = letterMap[key];
    if (key <= numberStrings.length && value != null) {
      numberStrings.insert(key, value);
    } else if (key == numberStrings.length && value != null) {
      numberStrings.add(value);
    }
  }
  return numberStrings;
}

@riverpod
int getCrossAxisCount(Ref ref, {int? length = 10}) {
  if (length == null) return 3;
  if (length < 4) return 5;
  if (length < 6) return 4;
  if (length < 10) return 3;
  return 2;
}

@riverpod
Stream<List<Result>> resultsListStream(Ref ref) {
  final onlyYear = ref.watch(filterByYearProvider);
  final year = ref.watch(yearSelectionProvider);
  final service = ref.watch(resultServiceProvider);
  return service.watchResults(onlyYear ? year : null);
}

@riverpod
Stream<List<Result>> yearResultsListStream(Ref ref) {
  final year = ref.watch(yearSelectionProvider);
  final service = ref.watch(resultServiceProvider);
  return service.watchResults(year);
}

@riverpod
Stream<Result?> resultStream(Ref ref, ResultId id) {
  final service = ref.watch(resultServiceProvider);
  return service.watchResult(id);
}

@riverpod
Future<Result?> result(Ref ref, ResultId id) {
  final service = ref.watch(resultServiceProvider);
  return service.fetchResult(id);
}

@riverpod
ResultService resultService(Ref ref) {
  return ResultService(ref);
}

class ResultService {
  ResultService(this.ref);

  final Ref ref;

  AuthRepository get authRepository => ref.read(authRepositoryProvider);
  ResultsRepository get resultsRepository =>
      ref.read(resultsRepositoryProvider);

  Future<void> setResult(Result result) async {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Exception('User cannot be null when setting Results');
    }
    await resultsRepository.setResult(user.uid, result);
  }

  Future<Result?> fetchResult(ResultId resultId) {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Exception('User cannot be null when watching Results');
    }
    return resultsRepository.fetchResult(user.uid, resultId);
  }

  Stream<Result?> watchResult(ResultId resultId) {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Exception('User cannot be null when watching Results');
    }
    return resultsRepository.watchResult(user.uid, resultId);
  }

  Stream<List<Result>> watchResults(SummitRockYear? year) {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Exception('User cannot be null when watching Results');
    }
    return resultsRepository.watchResultsList(uid: user.uid, year: year);
  }

  Future<void> deleteAllResults() async {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Exception('User cannot be null when deleting Results');
    }
    return resultsRepository.deleteAllResults(user.uid);
  }
}
